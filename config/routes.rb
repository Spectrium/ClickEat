Rails.application.routes.draw do
  get 'connection/index'
  get 'editprofil/info'
  get 'editprofil/password'
  devise_for :users
    resources :editprofil, only: [:index]
end