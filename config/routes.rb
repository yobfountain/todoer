Rails.application.routes.draw do

  devise_for :users
  resources :tasks do
  	post :complete
  end
  resources :users
  get 'logout', to: 'users#logout'
  get 'switch/:id', to: 'users#admin', as: "switch"
  root 'home#index'
end
