class StudentTeamsController < ApplicationController
    before_action :set_student_Teams, only: [:show, :edit, :update, :destroy]

    def index
        if !instructor_logged_in?
            redirect_to students_path
        end
        @student_Teams = Student_Team.all
    end

    def show
        @student_Team = Student_Team.find(params[:id])
    end

    def new
        if !instructor_logged_in?
            redirect_to students_path
        end
        @student_Team = Student_Team.new
    end

    def edit
    end

    def create
        @student_Team = Student_Team.new(student_Team_params)
        if @student_Team.save
            redirect_to teams_path
        else
            render 'new'
        end
    end

    def update
        current_student_Team.update(student_Team_params)
        flash[:success] = "Updated"
    
        redirect_to student_Teams_path
      end

      def destroy
      end

      private

      def set_student_Teams
        @student_Team = Student_Teams.find(params[:id])
      end

      def student_Team_params
        params.require(:student_Team).permit(:student_id, :team_id)
      end
end
