# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  get '/login', to: 'sessions#new'
  get '/my_profile', to: 'profiles#show_mine'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :work_experiences
  resources :profiles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
