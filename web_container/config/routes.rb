require 'constraints/domain_required'
require 'sidekiq/web'

Rails.application.routes.draw do
  constraints(Constraints::DomainRequired) do
    mount Public::Engine, at: '/'
  end

  mount Landing::Engine, at: '/'
  mount Admin::Engine, at: '/admin'

  authenticate :user, ->(u) { u.super_admin? } do
    mount Flipper::UI.app(Content.flipper) => '/flipper'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
