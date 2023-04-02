Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy, :update, :create, :show]
 
  #shows logged in users
  get '/user', to: "users#user"

  #logs in an user
  post 'user/login', to: 'sessions#user_login'

  #sign up an user
  post 'user/signup', to: 'sessions#user_signup'

  delete 'user/logout', to: 'sessions#user_logout'

  #admin
  #sign up an admin
  post 'admin/signup', to: 'sessions#admin_signup'

  #logs in admin
  post 'admin/login', to: 'sessions#admin_login'

  #log out admin
  post 'admin/logout', to: 'sessions#admin_logout'

  # delete '/logout', to: 'sessions#destroy'
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
  # post '/signup', to: 'users#create'
  # get '/me', to: 'users#show'
  # post '/login', to: 'sessions#create'
  # delete '/user/:id', to: 'users#destroy'
end
