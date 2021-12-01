class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user.update(user_params)
    flash[:success] = "Profile Updated"
    
    redirect_to users_path(@user)
  end
  
  def destroy
    @user.destroy
    flash[:success] = "User Deleted"

    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def current_user
      user = User.find(params[:id])
    end

end
