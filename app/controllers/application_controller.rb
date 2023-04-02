class ApplicationController < ActionController::API
  include ActionController::Cookies

  # before_action :authorize


# User methods
  def user_authorize
    return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :uid
  end

  def permitted_params
    params.permit(:id, :first_name, :last_name, :email, :password)
end

#admin
def admin_authorize
  return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :aid
end

def admin_params
  params.permit(:id, :username, :email, :password)
end

#rescue all common errors

def standard_error(expectation)
  render json: {message: "Failed", data: {info: expectation.message}}, status: :unprocessable_entity
end
end
































#     def authorize
#       @current_user = User.find_by(id: session[:user_id]) 
      
  
#       render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
#     end
  
#     def render_unprocessable_entity_response(exception)
#       render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
#     end
    
# end
