Rails.application.routes.draw do

  resources :tasks do
  	post :complete
  end
  resources :users
  get 'logout', to: 'users#logout'
  get 'switch/:id', to: 'users#admin', as: "switch"
  root 'home#index'
end
