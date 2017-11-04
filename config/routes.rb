Rails.application.routes.draw do

  devise_for :users
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [:edit, :update]
  root 'messages#index'

end
