require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
=begin
  test "should get home" do
    get home_url
    assert_response :success
  end
=end

  test "should get help" do
    get help_url
    assert_response :success
  end

end
