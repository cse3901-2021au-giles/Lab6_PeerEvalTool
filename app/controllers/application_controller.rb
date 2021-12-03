class ApplicationController < ActionController::Base
    include StudentSessionsHelper
    include InstructorSessionsHelper

    private

    # Confirms a logged-in student.
    def logged_in_student
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to student_login_url
      end
    end
    
    # Confirms a logged-in instructor.
    def logged_in_instructor
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to instructor_login_url
      end
    end
end
