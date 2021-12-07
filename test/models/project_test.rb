require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(Fname: "Example", Lname: "User", email: "user@example.com",
    password: "foobar", admin: false)
    @course = Course.create(cname: "Course", semester: "AU21", user_id: @user.id)
    @group = Group.new(gname: "Example", course_id: @course.id, user_id: @user.id)
    @project = Project.create(name: "Example", description: "example project", user_id, course_id: @course.id)
  end


  test "should be valid" do
    assert @project.valid?
  end
  
  test "user_id should be present" do
    @project.user_id = " "
    assert_not @project.valid?
  end
  
  test "course_id should be present" do
    @group.course_id = " "
    assert_not @project.valid?
  end

  test "name should be present" do
    @project.gname = " "
    assert_not @project.valid?
  end
  
  test "description should be present" do
    @project.description = " "
    assert_not @project.valid?
  end
end
