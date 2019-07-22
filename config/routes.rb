Rails.application.routes.draw do
  post "/login", to: "auth#login"
  post "/signup", to: "usernames#create"
  get "/profile", to: "usernames#profile"

  resources :tweets
  resources :hashtags
  resources :twitter_lists
  resources :twitter_accounts
  resources :follows


  namespace :avi do
    namespace :v1 do
      resources :usernames, only: [:create]
      # post "/login", to: "auth#login"

      # get "/profile", to: "users#profile"

    end
  end

end
