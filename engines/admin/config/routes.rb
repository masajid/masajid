Admin::Engine.routes.draw do
  root 'dashboards#index'
  resources :accounts, except: %i[show new create] do
    member do
      put :accept
      put :decline
    end
  end
  resources :cities, except: :show
  resources :regions, except: :show
  resources :countries, except: :show
  resources :pages, except: :show do
    post :sort, on: :collection
  end
  resources :articles, except: :show
  resources :messages, only: %i[index show]
  resources :volunteers, only: :index
  resources :subscribers, only: :index
  resources :newsletters, except: :show
  resource :slider, only: %i[edit update]
  resource :social_network, only: %i[edit update]
  resource :configuration, only: %i[edit update]
  resource :user, only: %i[edit update]

  namespace :api do
    resources :regions, only: :index
    resources :cities, only: :index
  end
end
