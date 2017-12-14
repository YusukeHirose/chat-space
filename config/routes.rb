Rails.application.routes.draw do

  devise_for :users
  # root "groups#new"
  root "groups#index"
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [:edit, :update]
  resources :groups, except: [:show, :destroy] do
    resources :messages
  end
  resources :members


end
