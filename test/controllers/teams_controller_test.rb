require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get teams index" do
    get teams_url
    assert_response :success
  end
end
