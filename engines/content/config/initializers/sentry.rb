Raven.configure do |config|
  config.dsn = Rails.application.credentials[Rails.env.to_sym][:sentry_dsn]
end
