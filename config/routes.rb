Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  #user login routes 
  get '/user_signin' => 'users#signin'
  get '/user_signup' => 'users#signup'
  post 'user_signin' => 'users#new_session'
  post '/user_signup' => 'users#new_account'
  delete '/user_logout' => 'users#logout'
end
