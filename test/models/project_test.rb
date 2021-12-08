require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(Fname: "Example", Lname: "User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar", admin: false)
    @course = Course.create(cname: "Course", user_id: @user.id)
    @project = Project.create(name: "Example", description: "example project")
  end

  test "should be valid" do
    assert_not @project.valid?
  end
  

  test "name should be present" do
    @project.name = " "
    assert_not @project.valid?
  end
  
  test "description should be present" do
    @project.description = " "
    assert_not @project.valid?
  end

end
