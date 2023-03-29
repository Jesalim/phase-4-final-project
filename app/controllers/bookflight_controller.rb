class BookflightController < ApplicationController
        # Skip authorize method before create and destroy actions
        skip_before_action :authorize, only: [:create, :destroy]
      
        def create
          # Find the user based on provided email parameter
          user = User.find_by(email: params[:email])
      
          # Authenticate user with provided password parameter
          if user&.authenticate(params[:password])
            # If user is authenticated, create a session with the user ID
            session[:user_id] = user.id
      
            # Render the user in JSON format with a created status
            render json: user, status: :created
          else
            # If user is not authenticated, render an error message with an unauthorized status
            render json: { error: ["Not authorized", "Invalid email or password"] }, status: :unauthorized
          end
        end
      
        def destroy
          # Delete the user ID from the session
          session.delete(:user_id)
      
          # Send no_content response
          head :no_content, status: :no_content
        end
      end
      
