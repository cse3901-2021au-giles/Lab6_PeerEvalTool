class EvaluationsController < ApplicationController
    before_action :current_evaluation, only: [:show, :edit, :update, :destroy]
    
      def index
        @evaluations = Evaluation.all
      end
    
      def show
    
      end
    
      def new
        @evaluation = Evaluation.new
      end
      
      def create
        student = Student.create(student_params)
        
        redirect_to students_path
      end
    
      def edit
    
      end
      
      def update
        @student.update(student_params)
        
        redirect_to student_path(@student)
      end
      
      def destroy
        @student.destroy
    
        redirect_to students_path
      end
      
      private
      
      def student_params
        params.require(:student).permit(:name, :email, :password)
      end
      
      def current_student
        @student = Student.find(params[:id])
      end
    end
