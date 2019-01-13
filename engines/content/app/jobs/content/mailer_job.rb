module Content
  class MailerJob < ::ActionMailer::DeliveryJob
    include Concerns::RedisFallback
  end
end
