Rails.application.routes.draw do
  
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users, only: [:index, :show, :edit, :update]
  
  root 'products#index'
  
  resources :products
  
  controller :products do
    post '/products/destroy' => 'products#destroy', as: :destroy
    get '/products/add_to_cart' => 'products#add_to_cart', as: :add_to_cart
    get '/products/remove_from_cart' => 'products#remove_from_cart', as: :remove_from_cart
  end
  
  controller :carts do 
    post '/carts/update_quantity' => 'carts#update_quantity', as: :update_quantity
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
