$:.push File.expand_path('lib', __dir__)

require 'content/version'
require 'content/specifications'

Gem::Specification.new do |s|
  s.name        = 'content'
  s.version     = Content::VERSION
  s.authors     = Content::Specifications::AUTHORS
  s.email       = Content::Specifications::EMAIL
  s.homepage    = Content::Specifications::HOMEPAGE
  s.summary     = 'Models, Mailers ... etc'
  s.description = s.summary
  s.license     = Content::Specifications::LICENCE
  s.files       = Content::Specifications::FILES

  s.add_dependency 'ahoy_matey'
  s.add_dependency 'ancestry'
  s.add_dependency 'attribute_normalizer'
  s.add_dependency 'bootstrap-email'
  s.add_dependency 'devise'
  s.add_dependency 'devise-async'
  s.add_dependency 'draper'
  s.add_dependency 'email_validator'
  s.add_dependency 'flipper-active_record', '~> 0.17.1'
  s.add_dependency 'font-awesome-rails', '~> 4.7.0.5'
  s.add_dependency 'friendly_id'
  s.add_dependency 'friendly_id-globalize'
  s.add_dependency 'geocoder'
  s.add_dependency 'globalize', '~> 5.3.0'
  s.add_dependency 'image_processing', '~> 1.9.3'
  s.add_dependency 'postgres-copy', '~> 1.4.0'
  s.add_dependency 'pundit'
  s.add_dependency 'rails', '~> 6.0.6'
  s.add_dependency 'rails-i18n', '~> 6.0.0'
  s.add_dependency 'rails_sortable'
  s.add_dependency 'sentry-raven', '~> 2.13.0'
  s.add_dependency 'sidekiq'
  s.add_dependency 'simple_form'
  s.add_dependency 'skylight', '~> 4.2.1'
  s.add_dependency 'stringex'
  s.add_dependency 'translation'
  s.add_dependency 'validates_timeliness'
end
