class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    if !user_signed_in?
      redirect_to welcomes_path
    end
    @ratings = Rating.all
  end

 
  def show
  end

  def new
    if !user_signed_in?
      redirect_to welcomes_path
    end
    @rating = Rating.new
  end


  def edit
    if !user_signed_in?
      redirect_to welcomes_path
    end
  end

  def create
    @rating = Rating.new(rating_params)

      if @rating.save
        flash[:success] = "Rating was successfully created"
        redirect_to ratings_path
	
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
      if @rating.update(rating_params)
        flash[:success] = "Rating was successfully updated"
        redirect_to ratings_path
      else
        render 'edit'
      end
  end


  def destroy
    @rating.destroy
    flash[:success] = "Rating was successfully deleted"
    redirect_to ratings_path
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:evaluate_id, :user_id, :group_id, :score, :comments)
    end
end
