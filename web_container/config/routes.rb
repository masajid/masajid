require 'constraints/domain_required'
require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { !Rails.env.production? || u.super_admin? } do
    mount Flipper::UI.app(Content.flipper) => '/flipper'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  constraints(Constraints::DomainRequired) do
    mount Public::Engine, at: '/'
  end

  mount Admin::Engine, at: '/admin'
  mount Landing::Engine, at: '/'
end
