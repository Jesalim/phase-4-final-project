class AdminsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :admin_authorize
    skip_before_action :admin_authorize, only: [:index]
  
    def index
      admins = Admin.all
      render json: admins
    end
  
    # shows the logged in admin
    def admin
      admin = Admin.find_by(id: session[:aid])
      if admin
        render json: admin, status: :ok
      else
        render json: {message: "admin not found"}, status: :unprocessable_entity
      end
    end
  
    def update_admin
      admin = Admin.find_by(id: params[:id])
      if admin
        admin.update(admin_params)
        render json: admin, status: :created
      else
        render json: {message: "admin not found"}, status: :unprocessable_entity
      end
    end
  
    def destroy
      admin = Admin.find(params[:id])
      admin.destroy
      render json: { message: "admin deleted" }, status: :ok
    end
  
    private
  
    def admin_params
      params.permit(:id, :username, :email, :password)
    end
  
    def admin_authorize
      render json: { error: "Unauthorized" }, status: :unauthorized unless session.include?(:aid)
    end
  
    def render_not_found_response
      render json: {error: "Admin not found"}, status: :not_found
    end
  end