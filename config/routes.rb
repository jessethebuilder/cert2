Rails.application.routes.draw do
  resources :transactions

  resources :accounts

  devise_for :users

  get 'users/auth/facebook/callback' => 'authentications#facebook_callback'

  resources :certs

  resources :stores

  root :to => 'certs#new'
end
