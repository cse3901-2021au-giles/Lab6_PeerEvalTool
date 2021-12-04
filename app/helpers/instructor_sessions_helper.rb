module InstructorSessionsHelper
  def instructor_log_in(instructor)
    session[:instructor_id] = instructor.id
  end

  def current_instructor
    if session[:instructor_id]
      @current_instructor ||= Instructor.find_by(id: session[:instructor_id])
    end
  end

  def instructor_logged_in?
    !current_instructor.nil?
  end

  def instructor_log_out
    session.delete(:instructor_id)
    @current_instructor = nil
  end
end
