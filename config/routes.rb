Rails.application.routes.draw do

  devise_for :users
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [:edit, :update]
  resources :groups, except: [:destroy]
  root 'messages#index'

end
