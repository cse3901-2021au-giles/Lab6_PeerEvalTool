class InstructorSessionsController < ApplicationController
  def new
  end

  def create
    instructor = Instructor.find_by(email: params[:instructor_session][:email].downcase)
    if instructor && instructor.authenticate(params[:instructor_session][:password])
      log_in instructor
      redirect_to instructor
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
