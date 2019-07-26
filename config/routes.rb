Rails.application.routes.draw do
  resources :lists
  resources :users
  post "/login", to: "auth#create"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  resources :tweets
  resources :hashtags
  resources :twitter_accounts


  # namespace :avi do
  #   namespace :v1 do
  #     resources :usernames, only: [:create]
  #     # post "/login", to: "auth#login"
  #
  #     # get "/profile", to: "users#profile"
  #
  #   end
  # end

end
