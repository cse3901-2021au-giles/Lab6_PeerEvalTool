class InstructorsController < ApplicationController
    before_action :current_instructor, only: [:show, :edit, :update, :destroy]
    
      def index
        @instructors = Instructor.all
      end
    
      def show
    
      end
    
      def new
        @instructor = Instructor.new
      end
      
      def create
        instructor = Instructor.create(instructor_params)
        
        redirect_to instructors_path
      end
    
      def edit
    
      end
      
      def update
        @instructor.update(instructor_params)
        
        redirect_to instructors_path(@instructor)
      end
      
      def destroy
        @instructor.destroy
    
        redirect_to instructors_path
      end
      
      private
      
      def instructor_params
        params.require(:instructor).permit(:name, :email, :password)
      end
      
      def current_instructor
        @instructor = Instructor.find(params[:id])
      end
    end
