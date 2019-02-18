Rails.application.routes.draw do

  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root "accueil#index"
  resources :accueil, only: [:index]
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:show]

  resources :gossip do
    resources :comment
  end
  resources :user, only: [:show, :new, :create]
  resources :city, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
