class EvalsController < ApplicationController
    before_action :current_eval, only: [:show, :edit, :update, :destroy]
    
      def index
        @evals = Eval.all
      end
    
      def show
    
      end
    
      def new
        @eval = Eval.new
      end
      
      def create
        eval = Eval.create(eval_params)
        
        redirect_to evals_path
      end
    
      def edit
    
      end
      
      def update
        @eval.update(eval_params)
        
        redirect_to eval_path(@eval)
      end
      
      def destroy
        @eval.destroy
    
        redirect_to evals_path
      end
      
      private
      
      def eval_params
        params.require(:eval).permit(:comments, :rating)
      end
      
      def current_eval
        @eval = Eval.find(params[:id])
      end
    end
