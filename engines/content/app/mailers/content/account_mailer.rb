module Content
  class AccountMailer < ApplicationMailer
    def notify_creation_new_entry(account)
      @account = account

      make_bootstrap_mail(
        to: Rails.application.credentials.admin_notification_emails&.split,
        subject: t('content.account_mailer.notify_creation_new_entry.subject', mosque: @account.mosque)
      )
    end

    def accept_entry(account, raw)
      @account = account
      @raw = raw

      make_bootstrap_mail(to: @account.email)
    end

    def decline_entry(account)
      @account = account

      make_bootstrap_mail(to: @account.email)
    end
  end
end
