Rails.application.routes.draw do

  devise_for :users
  # root "groups#new"
  root "groups#index"
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [:index, :edit, :update]
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :members


end
