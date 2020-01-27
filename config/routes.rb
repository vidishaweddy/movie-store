Rails.application.routes.draw do
  get 'carts/create'
  get 'carts/new'
  resources :movies
  resources :carts
  resources :receipts, only: [:show]
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  namespace :admin do
    root to: 'home#index'
    resources :home
    resources :genres
    resources :actors
    resources :users
    resources :movies
  end

  root 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
