Admin::Engine.routes.draw do
  root 'dashboards#index'
  resources :accounts, except: %i[new create] do
    member do
      put :accept
      put :decline
    end
  end
  resources :cities
  resources :regions
  resources :countries

  namespace :api do
    resources :regions, only: :index
    resources :cities, only: :index
  end
end
