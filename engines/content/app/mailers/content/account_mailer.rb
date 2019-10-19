module Content
  class AccountMailer < ApplicationMailer
    def notify_creation_new_entry(account)
      @account = account

      mail(
        to: ENV['ADMIN_NOTIFICATION_EMAILS']&.split,
        subject: t('content.account_mailer.notify_creation_new_entry.subject', mosque: @account.mosque)
      )
    end

    def accept_entry(account, raw)
      @account = account
      @raw = raw

      mail(to: @account.email, subject: t('content.account_mailer.accept_entry.subject'))
    end

    def decline_entry(account)
      @account = account

      mail(to: @account.email, subject: t('content.account_mailer.decline_entry.subject'))
    end
  end
end
