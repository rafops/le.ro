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

end
