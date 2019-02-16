Rails.application.routes.draw do


  root "accueil#index"
  resources :accueil, only: [:index]
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:show]
  resources :gossip
  resources :user, only: [:show]
  resources :city, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
