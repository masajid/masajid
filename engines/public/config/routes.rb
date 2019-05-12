Public::Engine.routes.draw do
  root 'home#index'

  resources :videos, only: :index
end
