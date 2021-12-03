require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get student login" do
    get student_login_url
    assert_response :success
  end
end
