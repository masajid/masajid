module Content
  class ApplicationMailer < ActionMailer::Base
    self.delivery_job = MailerJob

    layout 'content/mailer'

    default from: ENV['ADMIN_SENDER_EMAIL']
  end
end
