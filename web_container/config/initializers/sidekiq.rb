redis_conn = proc {
  Redis.new(url: Rails.application.credentials[Rails.env.to_sym][:redis_url])
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 2, &redis_conn)
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 10, &redis_conn)
end
