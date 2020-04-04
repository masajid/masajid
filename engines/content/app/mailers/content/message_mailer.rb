module Content
  class MessageMailer < ApplicationMailer
    def user_email(message)
      @message = message
      @account = message.account

      make_bootstrap_mail(
        reply_to: @message.email,
        to: @account.email,
        subject: t('content.message_mailer.user_email.subject', subject: @message.subject)
      )
    end
  end
end
