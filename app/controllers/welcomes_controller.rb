class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]
  #welcome page/home page for application. describes what the website does and
  #allows a user to make an account or sign in
  #different headers displayed based on who is logged in

  def confirmation
  end

  def index
    @welcomes = Welcome.all
  end

  def show
  end

  def new
    @welcome = Welcome.new
  end

  def edit
  end

  def create
    @welcome = Welcome.new(welcome_params)

      if @welcome.save
        flash[:success] = "Welcome was successfully created"
        redirect_to welcomes_path
      else
        render 'new'
      end
  end

  def update
      if @welcome.update(welcome_params)
        flash[:success] = "Welcome was successfully updated"
        redirect_to welcomes_path
      else
        render 'edit'
      end
  end

  def destroy
    @welcome.destroy
    flash[:success] = "Welcome successfully deleted"
    redirect_to welcomes_path
  end

  private
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    def welcome_params
      params.fetch(:welcome, {})
    end
end
