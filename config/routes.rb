Rails.application.routes.draw do
  resources :tweets
  resources :hashtags
  resources :twitter_lists
  resources :accounts
  resources :follows
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
