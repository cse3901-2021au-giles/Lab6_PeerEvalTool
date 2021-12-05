class StudentsTeamsController < ApplicationController
    before_action :set_students_teams, only: [:show, :edit, :update, :destroy]

    def index
        if !instructor_logged_in?
            redirect_to students_path
        end
        @students_teams = Students_Team.all
    end

    def show
    end

    def new
        if !instructor_logged_in?
            redirect_to students_path
        end
        @students_teams = Students_team.new
    end

    def edit
    end

    def create
        @students_teams = Students_team.new(students_team_params)
        if @students_teams.save
            redirect_to students_teams_path
        else
            render 'new'
        end
    end

    def update
        current_students_team.update(students_team_params)
        flash[:success] = "Updated"
    
        redirect_to students_teams_path
      end

      def destroy
      end

      private

      def set_students_teams
        @students_team = Students_teams.find(params[:id])
      end

      def students_team_params
        params.require(:students_team).permit(:student_id, :team_id)
      end
end
