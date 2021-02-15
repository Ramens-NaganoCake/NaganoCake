Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items
   resources :genres
   resources :orders
   resources :item_orders
 end
 namespace :customers do
   resources :cart_items
   resources :orders
   resources :delivery_destinations
 end
end
