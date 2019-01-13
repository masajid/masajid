module Content
  class ApplicationMailer < ActionMailer::Base
    self.delivery_job = MailerJob

    default from: ENV['ADMIN_SENDER_EMAIL']
    layout 'mailer'
  end
end
