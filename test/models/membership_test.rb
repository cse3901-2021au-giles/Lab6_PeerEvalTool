require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @membership = Membership.new(user_id: 1, group_id: 1)
  end

  test "should be valid" do
    assert @membership.valid?
  end

  test "user_id should be present" do
    @membership.user_id = " "
    assert @membership.valid?
  end
  
  test "group_id should be present" do
    @membership.group_id = " "
    assert @membership.valid?
  end

end
