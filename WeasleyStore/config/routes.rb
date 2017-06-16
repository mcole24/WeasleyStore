Rails.application.routes.draw do
  
  devise_for :users
  
  root 'products#index'
  
  resources :products
  resources :charges
  resources :carts
  
  
  controller :charges do 
    post '/charges/get_sum' => 'charges#get_sum', as: :get_sum
  end
  
  controller :products do
    post '/products/destroy' => 'products#destroy', as: :destroy
  end
  
  controller :carts do 
    get '/carts/index' => 'carts#index', as: :customer_list
  end
  
  
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
