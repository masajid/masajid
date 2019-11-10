module Content
  class NewsletterMailer < ApplicationMailer
    include Content::AccountsHelper

    def user_email(newsletter, subscriber)
      @newsletter = newsletter
      @account = newsletter.account

      make_bootstrap_mail(
        from: @account.email,
        to: subscriber.email,
        subject: newsletter.subject,
      )
    end
  end
end
