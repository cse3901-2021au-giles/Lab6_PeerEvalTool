class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  def index
    if !user_signed_in?
      redirect_to welcomes_path
    end
    if user_signed_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end

    @memberships = Membership.all
  end

  def show
  end

  def new
     # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end

    @membership = Membership.new
  end

  def edit
  end

  def create
    # Create a new member
    @membership = Membership.new(membership_params)

      if @membership.save
        flash[:success] = "Member was added to group successfully"
        redirect_to groups_path
      else
        render 'new'
      end
  end

  def update
    # Update a member
      if @membership.update(membership_params)
        flash[:success] = "Group members were updated successfully"
        redirect_to groups_path
      else
        render 'edit'
      end
  end

  def destroy

    Evaluate.all.collect.each do |evaluate|
      if evaluate.user_id == @membership.user_id
        evaluate.destroy
      end
    end

    Rating.all.collect.each do |rating|
      if rating.user_id == @membership.user_id
        rating.destroy
      end
    end

    # Removed a member
    @membership.destroy
      flash[:success] = "Members were removed from the group successfully"
      redirect_to groups_path
  end

  private
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:user_id, :group_id, :q1, :q2, :q3, :q4)
    end
end
