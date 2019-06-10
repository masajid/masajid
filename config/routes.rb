require 'constraints/subdomain_required'
require 'sidekiq/web'

Rails.application.routes.draw do
  constraints(Constraints::SubdomainRequired) do
    mount Public::Engine, at: '/'
  end

  mount Landing::Engine, at: '/'
  mount Admin::Engine, at: '/admin'

  authenticate :user, ->(u) { u.super_admin? } do
    mount Flipper::UI.app(Content.flipper) => '/flipper'
    mount Sidekiq::Web => '/sidekiq'
  end
end
