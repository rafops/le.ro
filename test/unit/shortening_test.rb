require 'test_helper'

class ShorteningTest < ActiveSupport::TestCase

  test "should not save shortening without an url" do
    shortening = Shortening.new
    assert !shortening.save
  end

  test "should not save shortening with an invalid url" do
    shortening = Shortening.new
    shortening.url = "invalidurl"
    assert !shortening.save
  end

  test "should have a number greater than zero after saving" do
    shortening = Shortening.new
    shortening.url = "http://valid.url.com"
    shortening.save
    assert shortening.number > 0
  end

  test "should return a shortened string after saving" do
    shortening = Shortening.new
    shortening.url = "http://valid.url.com"
    shortening.save
    assert shortening.shortened.length > 0
  end

  test "should return nil when find_by_shortened but it's nil" do
    assert_nil Shortening.find_by_shortened nil
  end

  test "should return nil when find_by_shortened but it's blank" do
    assert_nil Shortening.find_by_shortened nil.to_s
  end

  test "should return nil when finding by shortened but it's invalid" do
    assert_nil Shortening.find_by_shortened "!@$\t\n #{rand(10e5)}"
  end

  test "should return nil when finding by shortened but it doesn't exist" do
    original = Shortening.create(url: "http://valid.url.com/#{rand(10e5)}")
    assert_nil Shortening.find_by_shortened "#{(original.shortened) * 2}"
  end

  test "should return same object id when finding by shortened string" do
    original = Shortening.create(url: "http://valid.url.com/#{rand(10e5)}")
    restored = Shortening.find_by_shortened original.shortened
    assert_equal original.id, restored.id
  end

  test "should return same object id when finding by shortened string concatenated with non-dictionary string" do
    original = Shortening.create(url: "http://valid.url.com/#{rand(10e5)}")
    restored = Shortening.find_by_shortened "#{original.shortened}#{rand(10e5)}"
    assert_equal original.id, restored.id
  end

  test "should increase shortening length after some iteration" do
    Shortening.delete_all
    counter = 1
    begin
      original = Shortening.create(url: "http://valid.url.com/#{rand(10e5)}")
      original.number = counter
      original.save
      counter = counter + 1
    end while original.shortened.length < 2
    assert_equal 2, original.shortened.length
  end

end
