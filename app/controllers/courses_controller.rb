class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :destroy]

  def index
     # URL redirection to home page if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end
    # URL redirection to homepage if user logged in is not admin
    if logged_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # show all courses for current user
    @courses = Course.where(user_id: current_user)
  end


  def show
    # URL redirection to home page if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user logged in is not admin
    if logged_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # show all groups for a course
    @groups = Group.where(course_id: @course.id).all||nil

  end


  def new
   # URL redirection to home page if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user logged in is not admin
    if logged_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # new course add page
    @course = current_user.courses.build
  end


  def edit
    # URL redirection to home page if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user logged in is not admin
    if logged_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
  end


  def create
    @course = current_user.courses.build(course_params)

    # Creates a new course and saves it
      if @course.save
        flash[:success] = "Course was create"
        redirect_to courses_path
      else
        render 'new'
      end
  end


  def destroy
    # remove all groups in a course a course
    for i in 0...@course.group_ids.length
      Group.find(@course.group_ids[i]).destroy
    end
    # remove the course
    @course.destroy
      flash[:success] = "Course was deleted"
      redirect_to courses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:cname, :user_id)
    end

end
