require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get instructors_edit_url
    assert_response :success
  end

  test "should get new" do
    get instructors_signup_url
    assert_response :success
  end
end
