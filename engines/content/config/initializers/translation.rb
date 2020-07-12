TranslationIO.configure do |config|
  config.api_key        = Rails.application.credentials.translation_io_api_key
  config.source_locale  = 'en'
  config.target_locales = %w[ar de nl fr es ca it tr fa ur]

  config.disable_gettext   = true
  config.yaml_locales_path = Content::Engine.root.join('config/locales')
  config.metadata_path     = Content::Engine.root.join('config/locales/.translation_io')

  # translation keys that should not be touched by translators
  config.localization_key_prefixes = %w[
    validates_timeliness.error_value_formats
  ]
end
