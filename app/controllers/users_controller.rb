class UsersController < ApplicationController
    # Use rescue_from to handle ActiveRecord::RecordNotFound exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
    # Skip authorize method before create and show actions
    skip_before_action :authorize, only: [:create, :show]
  
    # Remove format from wrapped parameters
    wrap_parameters format: []
  
    def index
      # Render all users in JSON format
      render json: User.all
    end
  
    def show
      # Find the user by session ID
      @user = User.find_by(id: session[:user_id])
  
      # Render the user in JSON format
      render json: @user
    end
  
    def create
      # Create a new user with permitted parameters
      new_user = User.create!(new_user_params)
  
      # Check if the new user is valid and render a JSON response
      if new_user.valid?
        render json: new_user, status: :created
      else
        render json: { errors: new_user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    # Define permitted parameters for creating a new user
    def new_user_params
      params.permit(:first_name, :last_name, :email, :gender, :age, :password, :password_confirmation)
    end
  
    # Define record not found error handling method
    def record_not_found
      render json: { errors: ['User not found'] }, status: :not_found
    end
  end
  