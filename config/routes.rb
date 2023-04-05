Rails.application.routes.draw do
    #hotwire
  get "home/index"
  get "other/index"
  root to: "home#index"

  #login auth
  get '/user_signin' => 'users#signin'
  get '/user_signup' => 'users#signup'
  post 'user_signin' => 'users#new_session'
  post '/user_signup' => 'users#new_account'
  delete '/user_logout' => 'users#logout'
end
