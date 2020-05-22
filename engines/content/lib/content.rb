require 'rails-i18n'
require 'devise'
require 'devise-async'
require 'pundit'
require 'friendly_id'
require 'friendly_id/globalize'
require 'sidekiq'
require 'geocoder'
require 'globalize'
require 'simple_form'
require 'skylight'
require 'ancestry'
require 'sentry-raven'
require 'stringex'
require 'attribute_normalizer'
require 'postgres-copy'
require 'font-awesome-rails'
require 'flipper-active_record'
require 'bootstrap-email'
require 'ahoy_matey'
require 'draper'
require 'image_processing'
require 'validates_timeliness'
require 'translation'
require 'email_validator'

module Content
  require 'content/engine'

  def self.flipper
    @flipper ||= begin
      adapter = Flipper::Adapters::ActiveRecord.new
      Flipper.new(adapter)
    end
  end
end

require 'scoped_to'
require 'content/controller_helpers/volunteer'

require 'content/devise/mailers/helpers'
