Rails.application.routes.draw do
  resources :transactions

  resources :accounts

  devise_for :users

  #get 'users/auth/facebook/callback' => 'authentications#facebook_callback'

  resources :certs

  resources :stores

  #debug
  get 'facebook_js', :to => 'certs#facebook_js'


  get 'facebook_auth/callback', :to => 'authentications#facebook_auth_callback'

  root :to => 'certs#new'
end
