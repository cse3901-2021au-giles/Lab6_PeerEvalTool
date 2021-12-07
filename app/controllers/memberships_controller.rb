class MembershipsController < ApplicationController
  before_action :set_assginment, only: [:show, :edit, :update, :destroy]

  def index
    if !user_logged_in?
      redirect_to welcomes_path
    end
    if user_logged_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end

    @assignments = Assignment.all
  end

  def show
  end

  def new
     # URL redirection to home page if user is not logged in
    if !user_logged_in?
      redirect_to welcomes_path
    end

    @assignment = Assignment.new
  end

  def edit
  end

  def create
    # Create a new member
    @assignment = Assignment.new(assignment_params)

      if @assignment.save
        flash[:success] = "Project was aslogged successfully"
        redirect_to projects_path
      else
        render 'new'
      end
  end

  def update
    # Update a member
      if @assignment.update(assignment_params)
        flash[:success] = "Project was updated successfully"
        redirect_to projects_path
      else
        render 'edit'
      end
  end

  def destroy

    Evaluate.all.collect.each do |evaluate|
      if evaluate.user_id == @assignment.user_id
        evaluate.destroy
      end
    end

    Rating.all.collect.each do |rating|
      if rating.user_id == @assignment.user_id
        rating.destroy
      end
    end

    # Removed a member
    @assignment.destroy
      flash[:success] = "Assignment was removed successfully"
      redirect_to projects_path
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:user_id, :project_id)
    end
end
