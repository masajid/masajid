module Content
  class NewsletterJob < ApplicationJob
    queue_as :newsletters

    def perform(newsletter)
      subscribers = Content::Subscriber.where(account_id: newsletter.account_id)

      return if subscribers.empty?

      subscribers.each do |subscriber|
        Content::NewsletterMailer.user_email(newsletter, subscriber).deliver_now
      end

      newsletter.update_column(:sent_at, Time.current)
    end
  end
end
