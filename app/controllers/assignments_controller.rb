class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]

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
          redirect_to groups_path
        else
          render 'new'
        end
    end
  
    def update
      # Update a member
        if @assignment.update(assignment_params)
          flash[:success] = "Project was updated successfully"
          redirect_to groups_path
        else
          render 'edit'
        end
    end
  
    def destroy
  
      Evaluate.all.collect.each do |evaluate|
        if evaluate.group_id == @assignment.group_id
          evaluate.destroy
        end
      end
  
      Rating.all.collect.each do |rating|
        if rating.group_id == @assignment.group_id
          rating.destroy
        end
      end
  
      # Removed a member
      @assignment.destroy
        flash[:success] = "Project was deleted uccessfully"
        redirect_to groups_path
    end
  
    private
      def set_assignment
        @assignment = assignment.find(params[:id])
      end
  
      def assignment_params
        params.require(:assignment).permit(:project_id, :group_id, :q1, :q2, :q3, :q4)
      end
end
