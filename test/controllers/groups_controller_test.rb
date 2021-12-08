require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end
  test "should get index" do
    get groups_url
    assert_response :redirect
  end
  test "should show group" do
    get group_url(@group)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :redirect
  end
end
