module Content
  class ApplicationMailer < ActionMailer::Base
    self.delivery_job = MailerJob

    layout 'content/mailer'

    default from: Rails.application.credentials.admin_sender_email
  end
end
