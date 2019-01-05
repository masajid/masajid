Admin::Engine.routes.draw do
  root 'dashboards#index'
  resources :accounts
  resources :cities
  resources :regions
  resources :countries
end
