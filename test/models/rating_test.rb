require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  def setup
    @rating = Rating.new(evaluate_id: 1, user_id: 1, group_id: 1)
  end

  test "should be valid" do
    assert_not @rating.valid?
  end
  
  test "evaluate_id should be present" do
    @rating.evaluate_id = " "
    assert_not @rating.valid?
  end
  
  test "user_id should be present" do
    @rating.user_id = " "
    assert_not @rating.valid?
  end
  
  test "group_id should be present" do
    @rating.group_id = " "
    assert_not @rating.valid?
  end

  test "comments should be present" do
    @rating.comments = " "
    assert_not @rating.valid?
  end
end
