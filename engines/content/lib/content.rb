require 'devise'
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

module Content
  require 'content/engine'

  def self.flipper
    @flipper ||= begin
      adapter = Flipper::Adapters::ActiveRecord.new
      Flipper.new(adapter)
    end
  end
end
