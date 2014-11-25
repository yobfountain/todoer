Rails.application.routes.draw do

  resources :lists do
    resources :tasks
  end
  resources :tasklings, only: [:create, :update, :destroy]
  get 'switch_user', to: 'switch_user#set_current_user'
  devise_for :users
  resources :users
  root 'home#index'
end
