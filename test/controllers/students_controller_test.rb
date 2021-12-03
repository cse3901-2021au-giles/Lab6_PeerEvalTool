require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new student" do
    get new_student_url
    assert_response :success
  end
end
