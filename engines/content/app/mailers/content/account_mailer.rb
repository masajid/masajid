module Content
  class AccountMailer < ApplicationMailer
    def welcome_email(account)
      @account = account
      mail(to: @account.email, subject: t('.subject'))
    end

    def notify_creation_email(account)
      @account = account
      mail(to: ENV['ADMIN_NOTIFICATION_EMAILS']&.split, subject: t('.subject'))
    end

    def accept_email(account)
      @account = account
      mail(to: @account.email, subject: t('.subject'))
    end

    def decline_email(account)
      @account = account
      mail(to: @account.email, subject: t('.subject'))
    end
  end
end
