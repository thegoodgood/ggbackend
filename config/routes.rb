Rails.application.routes.draw do
  resources :articles
  resources :lists
  # get "/getlists", to: "lists#get_lists"
  # get "/lists", to: "lists#index"

  root to: "tweets#index"

  resources :users
  post "/login", to: "auth#create"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  resources :tweets
  get "/tweets", to: "tweets#index"
  post "/tweets/:id/upvote", to: "tweets#upvote"
  post "/tweets/:id/downvote", to: "tweets#downvote"

  get "/get_socialcommentary", to: "tweets#get_socialcommentary"
  get "/get_onthedaily", to: "tweets#get_timeline"
  post "/get_hashtag_tweets", to: "tweets#get_hashtag_search"



  resources :hashtags
  resources :twitter_accounts

end
# get "/get_social", to: "tweets#list"
