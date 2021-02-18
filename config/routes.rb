Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  get "/about" => "customer/items#about", as: "about"
  root to: 'customer/items#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin, path: :admins do
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders
   resources :item_orders
 end
 namespace :customer, path: :customers do
   resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :update, :create, :destroy]
   resources :orders
   resources :delivery_destinations
 end
end
