require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership = memberships(:one)
  end

  test "should get index" do
    get memberships_url
    assert_response :redirect
  end

  test "should get new" do
    get new_membership_url
    assert_response :redirect
  end

  test "should create membership" do
    get "/memberships/new"
    assert_response :redirect
  end

  test "should destroy membership" do
    assert_difference('Membership.count', -1) do
      delete membership_url(@membership)
    end
  end
end
