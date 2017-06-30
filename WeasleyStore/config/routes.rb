Rails.application.routes.draw do
  
  resources :line_items
  resources :carts
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  
  root 'products#index'
  
  resources :products
  resources :charges
  resource :shopping_cart
  
  controller :products do
    post '/products/destroy' => 'products#destroy', as: :destroy
    get '/products/add_to_cart' => 'products#add_to_cart', as: :add_to_cart
    get '/products/remove_from_cart' => 'products#remove_from_cart', as: :remove_from_cart
  end
  
  controller :shopping_carts do 
    post '/shopping_carts/remove' => 'shopping_carts#remove', as: :remove
  end

  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
