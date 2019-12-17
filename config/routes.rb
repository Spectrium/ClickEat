Rails.application.routes.draw do
  
  get 'dishes/index'
  get 'dishes/new'
  get 'dishes/create'
  get 'dishes/edit'
  get 'dishes/update'
  get 'dishes_types/index'
  get 'dishes_types/new'
  get 'dishes_types/create'
  get 'dishes_types/edit'
  get 'dishes_types/update'
  get 'restaurants/index'
  get 'restaurants/new'
  get 'restaurants/create'
  get 'restaurants/edit'
  get 'restaurants/update'
  get 'restaurants_specialities/index'
  get 'restaurants_specialities/new'
  get 'restaurants_specialities/create'
  get 'restaurants_specialities/edit'
  get 'restaurants_specialities/update'
  get 'specialities_categories/index'
  get 'specialities_categories/new'
  get 'specialities_categories/create'
  get 'specialities_categories/edit'
  get 'specialities_categories/update'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'admin_site/index'
  get 'home/index'
  get 'test/index'
  get 'test/show_restaurant'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users, paths: 'users', controllers: { sessions: "users/sessions", confirmations: "users/confirmations", registrations: "users/registrations" }
   
  resources :editprofil, only: [:index]
  devise_for :admins, paths: 'admins', controllers: { sessions: "admins/sessions", confirmations: "admins/confirmations", registrations: "admins/registrations"}
  devise_for :admins_restaurants, paths: 'admins_restaurants', controllers: { sessions: "admins_restaurants/sessions", confirmations: "admins_restaurants/confirmations", registrations: "admins_restaurants/registrations"}
  namespace :admin_site do
    resources :users, only: [:index, :new, :create, :edit, :update]
    resources :specialities_categories, only: [:index, :new, :create, :edit, :update]    
    resources :restaurants_specialities, only: [:index, :new, :create, :edit, :update]    
    resources :restaurants, only: [:index, :new, :create, :edit, :update]    
    resources :dishes_types, only: [:index, :new, :create, :edit, :update]
    resources :dishes, only: [:index, :new, :create, :edit, :update]
  end
end
