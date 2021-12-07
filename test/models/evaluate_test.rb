require 'test_helper'

class EvaluateTest < ActiveSupport::TestCase
  def setup
    @eval = Evaluate.new(attempt: false, user_id: 1, ratee_id: 1, group_id: 1)
  end
  
  test "user_id should be present" do
    @eval.user_id = " "
    assert_not @eval.valid?
  end
  
  test "ratee_id should be present" do
    @eval.ratee_id = " "
    assert_not @eval.valid?
  end
  
  test "group_id should be present" do
    @eval.group_id = " "
    assert_not @eval.valid?
  end
end
