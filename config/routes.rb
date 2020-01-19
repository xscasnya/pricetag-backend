Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'calculate', to: 'calculation#calculate'

  resources :products
  resources :shops
  resources :shopping_lists


end
