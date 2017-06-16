Rails.application.routes.draw do
  
  resources :carts
  devise_for :users
  
  root 'products#index'
  
  resources :products
  resources :charges
  
  
  controller :charges do 
    post '/charges/get_sum' => 'charges#get_sum', as: :get_sum
    post '/products/destroy' => 'products#destroy', as: :destroy
  end
  
  get '/users/index', to: 'users#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
