class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :authorize, only: [:create, :show]
    wrap_parameters format: []
    
    def index
        render json: User.all
    end


    def show
        @user = User.find_by(id: session[:user_id])
        render json: @user
    end

    # def show
    #     user = User.find_by(id: session[:user_id])
    #     if user
    #         render json: user
    #     else
    #         render json: { error: "Not authorized" }, status: :unauthorized
    #     end
    # end

   def create
      user = User.create!(permitted_params)
      if user.valid?
        session[:user_id] = user.id
        render json: user, serializer: UserSerializer, status: :created
      else
        render json: { error: "not valid data" }, status: :unprocessable_entity
      end
    end

    def destroy
        user = User.find(params[:id])
        head :no_content
    end

    private

    def permitted_params
        params.permit(:first_name, :last_name, :email, :password)
    end

    def record_not_found
        render json: { errors: ['User not found'] }, status: :not_found
    end

    # def authorize
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end
end
