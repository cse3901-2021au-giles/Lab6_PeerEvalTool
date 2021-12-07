require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @user = User.create(Fname: "Example", Lname: "User", email: "user@example.com",
                     password: "foobar", admin: false)
    @course = Course.create(cname: "Course", user_id: @user.id)
    @group = Group.new(gname: "Example", course_id: @course.id, user_id: @user.id)
  end

  test "should be valid" do
    assert @group.valid?
  end
  
  test "user_id should be present" do
    @group.user_id = " "
    assert_not @group.valid?
  end
  
  test "course_id should be present" do
    @group.course_id = " "
    assert_not @group.valid?
  end

  test "gname should be present" do
    @group.gname = " "
    assert_not @group.valid?
  end
  
  test "gname should not be too long" do
    @group.gname = "a" * 51
    assert_not @group.valid?
  end
end
