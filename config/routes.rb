Rails.application.routes.draw do
  get 'test/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users
    resources :editprofil, only: [:index]
end
