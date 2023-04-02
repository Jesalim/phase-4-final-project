class SessionsController < ApplicationController
    # skip_before_action :authorize, only: [:create, :destroy]
    # before_action :authorize, only: [:destroy]


    #user authentication

    def user_login

        sql = "first_name = :first_name OR email = :email"
        user = User.where(sql, { first_name: permitted_params[:first_name], email: permitted_params[:email] }).first
        if user&.authenticate(params[:password])
            session[:uid] = user.id
            render json: {message: "Login successful", data: {user:user}}, status: :ok
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def user_signup
        user = User.create(permitted_params)
        if user
            session[:uid] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors, status: :unprocessable_entity, message: "Failed"}
        end
    end

    def user_logout

        session.delete(:uid)
        render json: {message: "logged out successfully"}
    end

    #Admin authentication

    def admin_signup
        admin = Admin.create(admin_param)
        if admin
            session[:aid] = admin.id
            render json: admin, status: :created
        else
            render json: {errors: admin.errors, status: :unprocessable_entity, message: "Failed"}
        end
    end

    def admin_login
        admin = Admin.find_by(username: params[:username])
        if admin&.authenticate(params[:password])
            session[:aid] = admin.id
            render json: admin, status: :created
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    def admin_logout

        session.delete(:aid)
        render json: { message: "You have been logged out"}
    end

     private
     def admin_param
        params.require(:session).permit(:username, :email, :password)
    end

 end




















































#     def create

       
#         user = User.find_by(email: params[:email])
#         if user&.authenticate(params[:password])
#             session[:user_id] = user.id

       
#             render json: user, status: :created
#         else
#             render json: { message: "Invalid email or password", }, status: :unauthorized
#         end
#     end

#     def destroy
#           session.delete(:user_id)
#           head :no_content, status: :no_content
       
#     end
# end




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
  
