Rails.application.routes.draw do

  devise_for :users
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [:edit, :update]
  resources :groups, except: [:show, :destroy]
  root 'messages#index'

end
