Rails.application.routes.draw do
  devise_for :users
  get 'test/index'
  get 'test/show_restaurant'
  get "restaurant/index"
  get "dish/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
