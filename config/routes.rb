Rails.application.routes.draw do

  resources :lists do
  	post :join
    resources :tasks
  end
  resources :tasklings, only: [:update]
  get 'switch_user', to: 'switch_user#set_current_user'
  devise_for :users
  root 'home#index'
end
