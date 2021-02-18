Rails.application.routes.draw do

  get 'deliver_destinations/index'
  get 'deliver_destinations/edit'
  devise_for :customer, path: :customers,
     :controllers => {
      :registrations => "customer/registrations",
      :sessions => "customer/sessions",
      :passwords => "customer/passwords"
    }
    
  devise_for :admin, path: :admins,
    :controllers => {
      :sessions => "admin/sessions"
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin, path: :admins do
   resources :items
   resources :genres
   resources :orders
   resources :item_orders
 end
 namespace :customer, path: :customers do
   resources :cart_items
   resources :orders
   resources :delivery_destinations
   get 'orders/confirm' => 'orders#confirm',　as: 'order_confirm'
   get 'orders/complete' => 'orders#complete', as: 'order_complete'
 end
end
