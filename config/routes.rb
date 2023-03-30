Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy, :update, :create, :show]
  # resources :users, only: [:index, :create, :show]
  # get '/me', to: 'users#show'

  # resources :users, only: [:show] do
  #   # nested resource for flights
  #   resources :flights, only: [:show, :index, :create]
  # end



  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/user/:id', to: 'users#destroy'
  delete '/logout', to: 'sessions#destroy'
  post '/booking', to: 'bookings#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# resources :bookings, only: [:create, :index, :edit, :update, :destroy] do
#     collection do
#       get :manage
#       get :search
#       get "/:booking_id/checkout" => "bookings#checkout", as: :checkout
#       get "/:booking_id/payment" => "bookings#payment", as: :payment
#       get "/:booking_id/confirmation" => "bookings#confirmation",
#           as: :confirmation
#     end
#   end
end
