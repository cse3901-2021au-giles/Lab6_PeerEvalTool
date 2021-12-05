class CoursesController < ApplicationController
  include InstructorSessionsHelper
  before_action :current_instructor, only: [:show, :edit, :update, :destroy]
  
  def index
    if !instructor_logged_in?
      redirect_to students_path
    end
    @courses = Course.all
  end

  def show
    if !instructor_logged_in?
      redirect_to students_path
    end
    @course = Course.find(params[:id])
  end

  def new
    if !instructor_logged_in?
      redirect to students_path
    end
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
    if !instructor_logged_in?
      redirect_to students_path
    end
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
