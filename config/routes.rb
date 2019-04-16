Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users
  resources :restaurants
  resources :comments, only: %i(edit create update destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
