Rails.application.routes.draw do
  devise_for :users
  resources :test
  resources :restaurant
  resources :dish
  resources :type ,only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
