if Rails.env.production?
  Mailjet.configure do |config|
    config.api_key = Rails.application.credentials.mailjet[:api_key]
    config.secret_key = Rails.application.credentials.mailjet[:secret_key]
    config.default_from = Rails.application.credentials.admin_sender_email

    config.api_version = 'v3.1'
  end
end
