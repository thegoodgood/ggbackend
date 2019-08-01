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
  get "/get_timeline", to: "tweets#get_timeline"
  get "/tweets", to: "tweets#index"
  post "/get_hashtag_tweets", to: "tweets#get_hashtag_search"

  get "/get_socialcommentary", to: "tweets#get_social"

  resources :hashtags
  resources :twitter_accounts

end
