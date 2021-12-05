class CoursesController < ApplicationController
  include InstructorSessionsHelper
  before_action :current_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    #@instructor = current_instructor
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    current_course.update(course_params)
    flash[:success] = "Course Updated"

    redirect_to courses_path
  end
  
  def destroy
    if current_course.present?
      current_course.destroy
      flash[:success] = "Course Deleted"
    end  
    redirect_to courses_path
  end

  
  private
    def course_params
      params.require(:course).permit(:name, :instructor_id)
    end

    def current_course
      course = Course.find(params[:id])
    end
end
