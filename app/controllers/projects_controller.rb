class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
        #@teams = Team.where('id = ?', current_student.team_id)
    end

    def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to projects_path
        else
          render 'new'
        end
    end

    def update
        current_project.update(project_params)
        flash[:success] = "Project Updated"
    
        redirect_to projects_path
      end
      
      def destroy
        if current_project.present?
          current_project.destroy
          flash[:success] = "Project Deleted"
        end  
        redirect_to projects_path
      end
    
      private
    
        def project_params
          params.require(:project).permit(:name, :description)
        end
    
        def current_project
          project = Project.find(params[:id])
        end
end
