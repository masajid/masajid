module Content
  class AccountMailer < ApplicationMailer
    def welcome_email(account)
      @account = account
      @owner = account.owner
      mail(to: @owner.email, subject: t('.subject'))
    end

    def notify_creation_email(account)
      @account = account
      mail(to: ENV['ADMIN_NOTIFICATION_EMAILS']&.split, subject: t('.subject'))
    end
  end
end
