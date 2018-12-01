Admin::Engine.routes.draw do
  resources :accounts
  resources :cities
  resources :regions
  resources :countries
  resources :roles
end
