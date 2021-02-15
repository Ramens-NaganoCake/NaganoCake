Rails.application.routes.draw do

  namespace :admin do
    get 'orders/index'
  end

  namespace :admin do
    get 'orders/show'
  end

  namespace :customer do
    get 'orders/confirm' => 'orders#confirm'
  end

  namespace :customer do
    get 'orders/complete' => 'orders#complete'
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
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
