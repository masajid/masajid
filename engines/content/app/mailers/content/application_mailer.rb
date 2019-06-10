module Content
  class ApplicationMailer < ActionMailer::Base
    self.delivery_job = MailerJob

    default from: ENV['ADMIN_SENDER_EMAIL']
  end
end
