TranslationIO.configure do |config|
  config.api_key        = ENV['TRANSLATION_IO_API_KEY']
  config.source_locale  = 'en'
  config.target_locales = %w[de fr es ca it tr ar]

  config.disable_gettext = true
  config.yaml_locales_path = Content::Engine.root.join('config/locales')
  config.metadata_path     = Content::Engine.root.join('config/locales/.translation_io')
end
