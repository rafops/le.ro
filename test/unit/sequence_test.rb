require 'test_helper'

class SequenceTest < ActiveSupport::TestCase

  test "should return a number after calling nextval" do
    assert (Sequence.nextval_for self.class.to_s) > 0
  end

  test "should return a sequential number after calling nextval twice" do
    first = Sequence.nextval_for self.class.to_s
    second = Sequence.nextval_for self.class.to_s
    assert_equal second, first + 1
  end

end
