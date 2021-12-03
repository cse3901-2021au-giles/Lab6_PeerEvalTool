require 'test_helper'

class InstructorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get instructor login" do
    get instructor_login_url
    assert_response :success
  end
end
