class UsersController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :admin_authorize
    skip_before_action :admin_authorize, only: [:user, :user_register, :show, :destroy]
    
    #shows all users
    def index
        users = User.all
        render json: users, status:ok
    end

    #shows the logged in user
    def user
        user = User.find_by(id: session[:uid])
        if user
            render json: user, status: :ok
        else
            render json: {message: "User not found"}, status: :unprocessable_entity
        end
    end

    def user_register
        user = User.find_by(id: session[:uid])
        if user
            user.update(permitted_params)
            render json: {data: user, message: "User registered successfully"}          
    else
        render json: {message: "Failed"}
    end
end

    #deletes a user 
    def destroy
        user = User.find(params[:id])
        if user
            user.destroy
        head :no_content
        else
            render json: {message: "not found"}, status: :not_found
        end
    end

    private

    def permitted_params
        params.permit(:first_name, :last_name, :email, :password)
    end


end


