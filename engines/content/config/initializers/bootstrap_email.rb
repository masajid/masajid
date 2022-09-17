BootstrapEmail.configure do |config|
  # Defaults to ./bootstrap-email.scss or ./app/assets/stylesheets/bootstrap-email.scss in rails
  config.sass_email_location = File.expand_path('../../app/assets/stylesheets/content/mailer.scss', __dir__)

  # Defaults to ./bootstrap-head.scss or ./app/assets/stylesheets/bootstrap-head.scss in rails
  # config.sass_head_location = File.expand_path('path/to/bootstrap-head.scss', __dir__)

  # Custom sass that can be passed in to customize sass variables and such for the email sass
  # config.sass_email_string = '// Pass in custom sass'

  # Custom sass that can be passed in to customize sass variables and such for the head sass
  # config.sass_head_string = '// Pass in head custom sass'

  # Array of folders to add to the SASS load path to support imports in the custom SASS files
  # config.sass_load_paths = [File.expand_path('some/folder', __dir__)]

  # Defaults to ./.sass-cache or ./tmp/cache/bootstrap-email/.sass-cache in rails
  # config.sass_cache_location = [File.expand_path('some/folder', __dir__)]

  # Defaults to true, is disabled during CLI commands that output to standard out
  # config.sass_log_enabled = true

  # Turn on or off whether or not rails will also include a plain text email part, Default: true
  # config.generate_rails_text_part
end
