require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get show" do
    get course_url(@course)
    assert_response :redirect
  end

  test "should show course" do
    get course_url(@course)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :redirect
  end

  test "should get index" do
    get courses_url
    assert_response :redirect
  end
end
