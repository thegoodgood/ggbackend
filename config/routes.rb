Rails.application.routes.draw do
  resources :lists
  get "/getlists", to: "lists#get_lists"
  get "/lists", to: "lists#index"
  resources :users
  post "/login", to: "auth#create"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  resources :tweets
  get "/get_social", to: "tweets#list"
  get "/timeline", to: "tweets#new"
  get "/tweets", to: "tweets#index"
  get "/socialcommentary", to: "tweets#sc_tweets"
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
