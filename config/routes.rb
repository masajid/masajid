Rails.application.routes.draw do
  root 'home#index'
  resources :accounts, only: %i[new create]
  devise_for :users, class_name: 'Content::User'

  mount Admin::Engine, at: '/admin'
end
