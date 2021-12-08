require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @project = projects(:one)
  end
  
  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should get show" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

end
