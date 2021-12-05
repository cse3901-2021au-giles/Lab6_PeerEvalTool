class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
      @team = Team.find(params[:id])
  end

  def new
      @team = Team.new
  end

  def add_student
    team = Team.find(params[:id])
    @team.students << Student.find(params[:student_email])
  end

  def create
      @team = Team.new(team_params)
      if @team.save
        redirect_to teams_path
      else
        render 'new'
      end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
      current_team.update(team_params)
      flash[:success] = "team Updated"

      redirect_to teams_path
  end
  
  def destroy
    if current_team.present?
      current_team.destroy
      flash[:success] = "team Deleted"
    end  
    redirect_to teams_path
  end

  
  private
    def team_params
      params.require(:team).permit(:name, :instructor_id)
    end

    def current_team
      team = Team.find(params[:id])
    end
end
