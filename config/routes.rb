require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'
  resources :accounts, only: %i[new create]
  devise_for :users, class_name: 'Content::User'

  mount Admin::Engine, at: '/admin'

  authenticate :user, ->(u) { u.super_admin? } do
    mount Flipper::UI.app(Content.flipper) => '/flipper'
    mount Sidekiq::Web => '/sidekiq'
  end
end
