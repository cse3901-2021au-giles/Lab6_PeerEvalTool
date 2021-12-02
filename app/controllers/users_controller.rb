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
    #@user.update(user_params)
    #flash[:success] = "Profile Updated"
    
    #redirect_to users_path(@user)
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
    
    
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
      flash[:success] = "User Deleted"
    end  
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
