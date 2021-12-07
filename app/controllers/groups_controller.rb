 class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    # URL redirection to home page if user is not logged in
    if !user_logged_in?
      redirect_to welcomes_path
    end
    if user_logged_in? and current_user.try(:admin?)
      @groups = Group.where(user_id: current_user)
    else
      @groups = Group.all
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
    # Create a new group
    @group = current_user.groups.build
  end

 
  def edit
     # URL redirection to home page if user is not logged in
    if !user_logged_in?
      redirect_to welcomes_path
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    # Create and save a group
      if @group.save
        flash[:success] = "Group was successfully created"
        redirect_to groups_path
      else
        render 'new'
      end
  end


  def update
    # Update a group
      if @group.update(group_params)
        flash[:success] = "Group was successfully updated"
        redirect_to groups_path
      else
        render 'edit'
      end
  end

  def destroy
    Evaluate.all.collect.each do |evaluate|
      if evaluate.group_id == @group.id
        evaluate.destroy
      end
    end

    Rating.all.collect.each do |rating|
      if rating.group_id == @group.id
        rating.destroy
      end
    end

    for i in @group.membership_ids
      Membership.find(i).destroy
    end

    @group.destroy
      flash[:success] = "Group was successfully deleted"
      redirect_to groups_path
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:gname, :course_id, :user_id)
    end
end
