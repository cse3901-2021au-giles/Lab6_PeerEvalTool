require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(cname: "Course")
  end

  test "should be valid" do
    assert @course.valid?
  end
  

  test "cname should be present" do
    @course.cname = " "
    assert_not @course.valid?
  end
  
  test "cname should not be too long" do
    @course.cname = "a" * 51
    assert_not @course.valid?
  end
end
