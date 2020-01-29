Rails.application.routes.draw do
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
    resources :types, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :specialities, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :specialities_categories, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :restaurants_specialities, only: [:index, :new, :create, :edit, :update, :destroy, :show]    
    resources :restaurants, only: [:index, :new, :create, :edit, :update, :update, :destroy, :show]
    resources :category_dishes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :dishes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :type_admins
  end
end
