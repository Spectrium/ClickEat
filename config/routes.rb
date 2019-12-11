Rails.application.routes.draw do
  
  get 'home/index'
  get 'test/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users, paths: 'users', controllers: { sessions: "users/sessions", confirmations: "users/confirmations", registrations: "users/registrations" }
   
  resources :editprofil, only: [:index]
  devise_for :admins, paths: 'admins', controllers: { sessions: "admins/sessions", confirmations: "admins/confirmations", registrations: "admins/registrations"}
  devise_for :admins_restaurants, paths: 'admins_restaurants', controllers: { sessions: "admins_restaurants/sessions", confirmations: "admins_restaurants/confirmations", registrations: "admins_restaurants/registrations"}
end
