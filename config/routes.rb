Rails.application.routes.draw do

<<<<<<< HEAD
  get 'deliver_destinations/index'
  get 'deliver_destinations/edit'
  devise_for :customer, path: :customers,
     :controllers => {
=======
  devise_for :customer,
    path: :customers,
    :controllers => {
>>>>>>> origin/develop
      :registrations => "customer/registrations",
      :sessions => "customer/sessions",
      :passwords => "customer/passwords"
    }
<<<<<<< HEAD
    
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
=======

  devise_for :admin,
    path: :admins,
    :controllers => {
      :sessions => "admin/sessions"
    }

  get "/" => "customer/items#top", as: "top"
  get "/about" => "customer/items#about", as: "about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin, path: :admins do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :item_orders, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    get "orders/current_user_order/:id" => "orders#current_user_order"
  end

  namespace :customer, path: :customers do

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete "cart_items" => "cart_items#all_destroy", as: "cart_item_all_destroy"

    resources :orders, only: [:new, :create, :index, :show]
    get "orders/confirm" => "orders#confirm", as: "order_confirm"
    get "orders/complete" => "orders#complete", as: "order_complete"

    resources :deliver_destinations, only: [:index, :create, :destroy, :edit, :update]

    get "my_page" => "customers#show", as: "customer"
    get "leave" => "customers#leave", as: "customer_leave"
    patch "out" => "customers#out", as: "customer_out"
    get "edit/my_page" => "customers#edit", as: "customer_edit"
    patch "update" => "customers#update", as: "customer_update"
  end
  
>>>>>>> origin/develop
end
