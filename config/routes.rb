require 'constraints/subdomain_required'
require 'sidekiq/web'

Rails.application.routes.draw do
  constraints(Constraints::SubdomainRequired) do
    mount Public::Engine, at: '/'
  end

  mount Admin::Engine, at: '/admin'

  root 'home#index'
  resources :accounts, only: %i[new create]
  devise_for :users, class_name: 'Content::User'

  authenticate :user, ->(u) { u.super_admin? } do
    mount Flipper::UI.app(Content.flipper) => '/flipper'
    mount Sidekiq::Web => '/sidekiq'
  end
end
