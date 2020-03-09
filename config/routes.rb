# frozen_string_literal: true

Rails.application.routes.draw do
  resources :poketypes
  resources :items
  resources :moves
  resources :ptypes
  resources :pokedexes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pokedexes#index'
end
