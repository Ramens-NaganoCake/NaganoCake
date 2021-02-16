Rails.application.routes.draw do
  devise_for :customer
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin, path: :admins do
   resources :customers, only: [:show, :index, :edit, :update]
   resources :items
   resources :genres
   resources :orders, only: [:index, :show, :upate]
   resources :item_orders
 end
 namespace :customers do
   resources :cart_items
   resources :orders
   resources :delivery_destinations
 end
end
