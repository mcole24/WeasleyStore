Rails.application.routes.draw do
  
  resources :carts
  devise_for :users
  
  root 'products#index'
  
  resources :products
  resources :charges
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
