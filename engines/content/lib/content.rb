require 'rails-i18n'
require 'devise'
require 'devise-async'
require 'pundit'
require 'friendly_id'
require 'sidekiq'
require 'geocoder'
require 'simple_form'
require 'ancestry'
require 'shrine'
require 'stringex'
require 'attribute_normalizer'
require 'postgres-copy'
require 'flipper-active_record'
require 'bootstrap-email'
require 'ahoy_matey'
require 'draper'
require 'image_processing'
require 'validates_timeliness'
require 'translation'

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
