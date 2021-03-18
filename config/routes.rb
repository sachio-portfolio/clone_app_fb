Rails.application.routes.draw do
  get 'sessions/new'
  root 'pictures#index'
  resources :pictures
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
