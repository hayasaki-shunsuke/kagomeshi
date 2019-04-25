Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users
  resources :restaurants
  resources :comments
  get "/@:nickname", controller: "users", action: "show", as: :user
end
