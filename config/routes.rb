Rails.application.routes.draw do
  devise_for :customer
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin, path: :admins do
   resources :customers, only: [:show, :index, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   get "orders/current_user_order/:id" => "orders#current_user_order"
   resources :item_orders, only: [:update]
 end
 namespace :customers do
   resources :cart_items
   resources :orders
   resources :delivery_destinations
 end
end
