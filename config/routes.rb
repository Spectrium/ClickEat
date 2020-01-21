Rails.application.routes.draw do
  root'home#index'
  get 'admin_site/index'
  
  resources :test
  resources :restaurant do 
    member do 
      put 'like', to: "restaurant#upvote"
      put 'dislike', to: "restaurant#downvote"
    end
  end
  resources :dish do
    member do 
      put 'like', to: "dish#upvote"
      put 'dislike', to: "dish#downvote"
    end
  end
  resources :type ,only: [:show]
  resources :category_dish ,only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users, paths: 'users', controllers: { sessions: "users/sessions", confirmations: "users/confirmations", registrations: "users/registrations" }
   
  resources :editprofil, only: [:index]
  devise_for :admins, paths: 'admins', controllers: { sessions: "admins/sessions", confirmations: "admins/confirmations", registrations: "admins/registrations"}
  devise_for :admins_restaurants, paths: 'admins_restaurants', controllers: { sessions: "admins_restaurants/sessions", confirmations: "admins_restaurants/confirmations", registrations: "admins_restaurants/registrations"}
  namespace :admin_site do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :specialities_categories, only: [:index, :new, :create, :edit, :update, :destroy, :show]    
    resources :restaurants_specialities, only: [:index, :new, :create, :edit, :update, :destroy, :show]    
    resources :restaurants, only: [:index, :new, :create, :edit, :update, :update, :destroy, :show]
    resources :dishes_types, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :dishes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end
end