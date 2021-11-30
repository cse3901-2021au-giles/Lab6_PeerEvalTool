class StudentsController < ApplicationController
before_action :current_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show

  end

  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    
    redirect_to students_path
  end

  def edit

  end
  
  def update
    @student.update(student_params)
    flash[:success] = "Profile Updated"
    
    redirect_to students_path(@student)
  end
  
  def destroy
    @student.destroy
    flash[:success] = "User Deleted"

    redirect_to students_path
  end
  
  private
  
  def student_params
    params.require(:student).permit(:name, :email, :password, :accountType)
  end
  
  def current_student
    @student = Student.find(params[:id])
  end
end
