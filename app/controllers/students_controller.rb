class StudentsController < ApplicationController
before_action :current_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @evals = @student.evals.paginate(page: params[:page])
  end

  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)

    if @student.save
      log_in @student
      redirect_to @student
      flash[:success] = "Welcome!"
    else
      render 'new'
    end
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

  def correct_student
    @student = Student.find(params[:id])
    redirect_to(root_url) unless current_student?(@student)
  end

end
