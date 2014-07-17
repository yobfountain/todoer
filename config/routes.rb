Rails.application.routes.draw do

  resources :tasks do
  	post :complete
  end
  resources :users
  get 'logout', to: 'users#logout'
  root 'home#index'
end
