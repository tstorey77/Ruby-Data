# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/skip-assets'
  resources :poketypes
  resources :items
  resources :moves
  resources :ptypes
  resources :pokedexes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'search', to: 'pokedexes#search', as: 'search'
  get 'about', to: 'pages#about', as: 'about'
  root to: 'pokedexes#index'
end
