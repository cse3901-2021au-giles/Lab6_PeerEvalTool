module InstructorSessionsHelper
  def log_in(instructor)
    session[:instructor_id] = instructor.id
  end

  def current_instructor
    if session[:instructor_id]
      @current_instructor ||= Instructor.find_by(id: session[:instructor_id])
    end
  end

  def logged_in?
    !current_instructor.nil?
  end

  def log_out
    session.delete(:instructor_id)
    @current_instructor = nil
  end
end
