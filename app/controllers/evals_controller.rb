class EvalsController < ApplicationController
  def index
    @evals = Eval.all
  end

  def show
    @eval = Eval.find(params[:id])
  end

  def new
    @eval = Eval.new
  end

  def create
    @eval = Eval.new(eval_params)
    if @eval.save
      redirect_to evals_path
    else
      render 'new'
    end
  end

  def edit
    @eval = Eval.find(params[:id])
  end

  def update
    current_eval.update(eval_params)
    flash[:success] = "Evaluation Updated"

    redirect_to evals_path
  end
  
  def destroy
    if current_eval.present?
      current_eval.destroy
      flash[:success] = "Evaluation Deleted"
    end  
    redirect_to evals_path
  end

  
  private
    def eval_params
      params.require(:eval).permit(:name)
    end

    def current_eval
      eval = Eval.find(params[:id])
    end
end
