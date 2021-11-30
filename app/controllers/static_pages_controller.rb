class StaticPagesController < ApplicationController
  def home
    @eval = current_student.evals.build if logged_in?
  end

  def help
  end
end
