require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
=begin
  test "should get edit" do
    get instructor_edit_url
    assert_response :success
  end
=end

  test "should get new" do
    get instructor_signup_url
    assert_response :success
  end
end
