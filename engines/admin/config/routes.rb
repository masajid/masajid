Admin::Engine.routes.draw do
  resources :cities
  resources :regions
  resources :countries
  resources :roles
end
