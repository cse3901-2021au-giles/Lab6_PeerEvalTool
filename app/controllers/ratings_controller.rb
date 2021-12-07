class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    # URL redirection to homepage if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end
    @ratings = Rating.all
  end

 
  def show
  end

  def new
     # URL redirection to homepage if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end
    #new rating
    @rating = Rating.new
  end


  def edit
    #edit a rating
     # URL redirection to homepage if user is not logged in
    if !logged_in?
      redirect_to welcomes_path
    end
  end

  def create
    #create and save a rating. associates a rating with a user
    @rating = Rating.new(rating_params)

      if @rating.save
        flash[:success] = "Rating was successfully created"
        redirect_to welcomes_path
	
	current_score=User.find(Evaluate.find(@rating.evaluate_id).ratee_id).score
	new_num=User.find(Evaluate.find(@rating.evaluate_id).ratee_id).commented_num + 1
	new_score=(current_score+@rating.score)/new_num
	User.find(Evaluate.find(@rating.evaluate_id).ratee_id).update_attribute :score, new_score
	User.find(Evaluate.find(@rating.evaluate_id).ratee_id).update_attribute :commented_num, new_num
      else
        render 'new'
      end
  end

  def update
    #update rating
      if @rating.update(rating_params)
        flash[:success] = "Rating was successfully updated"
        redirect_to welcomes_path
      else
        render 'edit'
      end
  end


  def destroy
    #delete a rating and redirect to home page
    @rating.destroy
    flash[:success] = "Rating was successfully deleted"
    redirect_to welcomes_path
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:evaluate_id, :user_id, :group_id, :score, :comments)
    end
end
