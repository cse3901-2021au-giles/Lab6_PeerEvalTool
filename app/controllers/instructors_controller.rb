class InstructorsController < ApplicationController
before_action :current_instructor, only: [:show, :edit, :update, :destroy]

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
    instructor_log_in @instructor
      redirect_to instructors_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    current_instructor.update(instructor_params)
    flash[:success] = "Profile Updated"

    redirect_to instructors_path
  end
  
  def destroy
    if current_instructor.present?
      current_instructor.destroy
      flash[:success] = "Instructor Deleted"
    end  
    redirect_to instructors_path
  end

  private

    def instructor_params
      params.require(:instructor).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def current_instructor
      instructor = Instructor.find(params[:id])
    end

end
