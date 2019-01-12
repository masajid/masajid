module Content
  class ApplicationMailer < ActionMailer::Base
    default from: ENV['ADMIN_SENDER_EMAIL']
    layout 'mailer'
  end
end
