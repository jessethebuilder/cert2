Rails.application.routes.draw do
  resources :transactions

  resources :accounts

  devise_for :users

  resources :certs

  resources :stores

end
