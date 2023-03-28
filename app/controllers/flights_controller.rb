class FlightsController < ApplicationController
    # Disable parameter wrapping
    wrap_parameters format: []
  
    # Skip authorize method before all actions except destroy
    skip_before_action :authorize, only: [:destroy]
  
    def index
      # Find the user associated with the current session ID
      user = User.find_by(id: session[:user_id])
  
      # Retrieve all flights belonging to the user
      flights = user.flights
  
      # Render flights in JSON format with user association included
      render json: flights, include: :user
    end
  
    def show
      # Find the flight based on provided id parameter
      flight = Flight.find(params[:id])
  
      # Render flight in JSON format
      render json: flight
    end
  
    def destroy
      # Find the flight based on provided id parameter
      flight = Flight.find(params[:id])
  
      # Destroy the flight
      flight.destroy
  
      # Send no_content response
      head :no_content
    end
  
    def create
      # Create a new flight for the current user with the parameters provided
      new_flight = @current_user.flights.create!(new_flight_params)
  
      # Render the new flight in JSON format with a created status
      render json: new_flight, status: :created
  
    rescue ActiveRecord::RecordInvalid => e
      # If creation fails, render an error message with an unprocessable entity status
      render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    def update
      # Find the flight based on the provided id parameter
      flight = Flight.find(params[:id])
  
      if flight
        # Update the flight with the provided parameters
        flight.update!(new_flight_params)
  
        # Render the updated flight in JSON format with an ok status
        render json: flight, status: :ok
      else
        # If flight not found, render an error message with a not_found status
        render json: { error: "Flight not found" }, status: :not_found
      end
    end
  
    private
  
    # Permit only necessary flight parameters
    def new_flight_params
      params.permit(:destination, :departure, :flight_date, :return_date)
    end
  
    # Check if user is authorized to perform requested action (currently commented out)
    # def authorize
    #   return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end
  end
  
