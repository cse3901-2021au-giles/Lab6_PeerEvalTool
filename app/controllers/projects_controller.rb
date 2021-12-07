class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      # URL redirection to home page if user is not logged in
      if !user_logged_in?
        redirect_to welcomes_path
      end
      # URL redirection to homepage if user logged and is not admin
      if user_logged_in? and current_user.try(:admin?)
        @projects = Project.where(user_id: current_user)
      else
        @projects = Project.all
      end
    end
  
  
    def show
    # URL redirection to home page if user is not logged in
      if !user_logged_in?
        redirect_to welcomes_path
      end
  
    end
  
  
    def new
      # URL redirection to home page if user is not logged in
      if !user_logged_in?
        redirect_to welcomes_path
      end
      # Create a new project
      @project = current_user.projects.build
    end
  
   
    def edit
       # URL redirection to home page if user is not logged in
      if !user_logged_in?
        redirect_to welcomes_path
      end
    end
  
    def create
      @project = current_user.projects.build(project_params)
      # Create and save a project
        if @project.save
          flash[:success] = "Project was successfully created"
          redirect_to projects_path
        else
          render 'new'
        end
    end
  
  
    def update
      # Update a project
        if @project.update(project_params)
          flash[:success] = "Project was successfully updated"
          redirect_to projects_path
        else
          render 'edit'
        end
    end
  
    def destroy
      #destry a project and all evals asociated with it
      Evaluate.all.collect.each do |evaluate|
        if evaluate.group_id == @project.id
          evaluate.destroy
        end
      end
  
      Rating.all.collect.each do |rating|
        if rating.project_id == @project.id
          rating.destroy
        end
      end
  
      @project.destroy
        flash[:success] = "Project was successfully deleted"
        redirect_to projects_path
    end
  
    private
      def set_project
        @project = Project.find(params[:id])
      end
  
      def project_params
        params.require(:project).permit(:name, :description, :user_id, :course_id)
      end
end
