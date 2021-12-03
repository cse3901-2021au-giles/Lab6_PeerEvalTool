class StudentsController < ApplicationController
  before_action :current_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    current_student.update(student_params)
    flash[:success] = "Profile Updated"

    redirect_to students_path
  end
  
  def destroy
    if current_student.present?
      current_student.destroy
      flash[:success] = "User Deleted"
    end  
    redirect_to students_path
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def current_student
      student = Student.find(params[:id])
    end

end
