Rails.application.routes.draw do
  
  resources :order_details
  resources :orders
  # resources :line_items


  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'items/:dish_id/line_items' => "line_items#create", as: "line_item_create"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  # post 'line_items' => "line_items#create"
  # get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy", as: "line_item_destroy"
  
  root 'home#index'
  get 'admin_site/index', to:"admin_site#index", as: "root_admin"
  
  get 'carts', to:"carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'to_order', to:"carts#add_to_order", as: "to_order"



  resources :test
  resources :restaurant do 
    member do 
      put 'like', to: "restaurant#upvote"
      put 'dislike', to: "restaurant#downvote"
    end
  end
  resources :dish do
    resources :line_items
    member do 
      put 'like', to: "dish#upvote"
      put 'dislike', to: "dish#downvote"
    end
  end
  # get '/added_to_cart/:id', to: 'dish#added_to_cart', as:'dish_added_to_cart'
  resources :type ,only: [:show]
  resources :category_dish ,only: [:show]
  resources :subscription_type ,only: [:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users, paths: 'users', controllers: { sessions: "users/sessions", confirmations: "users/confirmations", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :editprofil, only: [:index]
  devise_for :admins, paths: 'admins', controllers: { 
    sessions: "admins/sessions",
    confirmations: "admins/confirmations", 
    registrations: "admins/registrations"
  }
  devise_for :admins_restaurants, paths: 'admins_restaurants', controllers: { sessions: "admins_restaurants/sessions", confirmations: "admins_restaurants/confirmations", registrations: "admins_restaurants/registrations"}
  namespace :admin_site do
    resources :types, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :specialities, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :specialities_categories, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :restaurants_specialities, only: [:index, :new, :create, :edit, :update, :destroy, :show]    
    resources :restaurants, only: [:index, :new, :create, :edit, :update, :update, :destroy, :show]
    resources :category_dishes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :dishes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :type_admins
    resources :dashboards, only:[:index]
    resources :orders, only:[:index,:edit]
    resources :admin_line_items, only: [:index, :show, :edit, :update]
    resources :order_states, only: [:index, :edit, :update]
    
    post '/annulation/:id', to: 'admin_line_items#cancel', as:"canceled"
    
    get '/edit_validation_line_item/:id', to: 'orders#edit_validation_line_item', as:'edit_validation_line_item'
    get '/edit_validation_order/:id', to: 'orders#edit_validation_order', as:'edit_validation_order'

    post '/validation_commande', to: 'orders#validation_order', as:"validation_order"
    post '/validation_commande_restaurant', to: 'orders#validation_line_item', as:"validation_line_item"
    
  end
end