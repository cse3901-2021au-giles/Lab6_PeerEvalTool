require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @user = User.create(Fname: "Example", Lname: "User", email: "user@example.com",
                     password: "foobar", admin: false)
    @course = Course.new(cname: "Course", semester: "AU21", user_id: @user.id)
  end

  test "should be valid" do
    assert @course.valid?
  end
  
  test "user_id should be present" do
    @course.user_id = " "
    assert_not @course.valid?
  end

  test "cname should be present" do
    @course.cname = " "
    assert_not @course.valid?
  end
  
  test "cname should not be too long" do
    @course.cname = "a" * 51
    assert_not @course.valid?
  end
end
