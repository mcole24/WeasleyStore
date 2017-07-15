Rails.application.routes.draw do
  
  resources :charges
  resources :orders
  resources :line_items do
    get 'decrease', on: :member
    get 'increase', on: :member
  end
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
  
  controller :line_items do 
    post '/line_items/increase_quantity' => 'line_items#increase_quantity', as: :increase_quantity
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
