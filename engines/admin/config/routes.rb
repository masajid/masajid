Admin::Engine.routes.draw do
  root 'dashboards#index'
  resources :accounts
  resources :cities
  resources :regions
  resources :countries

  namespace :api do
    resources :regions, only: :index
    resources :cities, only: :index
  end
end
