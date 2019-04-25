Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  namespace "api" do
    resources :restaurants, only: %i(index)
  end

  resources :restaurants
  resources :comments
  get "/@:nickname", controller: "users", action: "show", as: :user
end
