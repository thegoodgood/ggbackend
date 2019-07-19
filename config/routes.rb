Rails.application.routes.draw do
  resources :tweets
  resources :hashtags
  resources :twitter_lists
  resources :twitter_accounts
  resources :follows
  # resources :users
  # get "/users", to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
