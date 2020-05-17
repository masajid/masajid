Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials[Rails.env.to_sym][:redis_url], size: 2 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials[Rails.env.to_sym][:redis_url], size: 10 }
end
