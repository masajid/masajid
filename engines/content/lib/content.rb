require 'devise'
require 'pundit'
require 'sidekiq'
require 'geocoder'
require 'simple_form'
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

require 'scoped_to'
