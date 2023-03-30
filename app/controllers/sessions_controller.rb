class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create, :destroy]
    # before_action :authorize, only: [:destroy]

    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id

       
            render json: user, status: :created
        else
            render json: { error: ["Not authorized", "Invalid email or password"] }, status: :unauthorized
        end
    end

    def destroy
          session.delete(:user_id)
          head :no_content, status: :no_content
       
    end
end




# redirect_to root_url, notice: "Welcome back, #{current_user.name}"
# else
#   redirect_to login_path, alert: "Incorrect username or password"
# end
# end

# def destroy
# user = current_user.name
# session[:user_id] = nil
# redirect_to root_url, notice: "See you again, #{user}!"
# end

# def sessions_params
# params.permit(:email, :password)
# end
  
