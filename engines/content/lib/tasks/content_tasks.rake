namespace :content do
  desc 'Purge authentication tokens'
  task purge_authentication_tokens: :environment do
    Content::User.where.not(authentication_token: nil).update_all(authentication_token: nil)
  end

  desc 'Send Newsletters'
  task newsletters: :environment do
    newsletters =
      Content::Newsletter
        .where(Content::Newsletter.arel_table[:date].lteq(Date.today))
        .where(sent_at: nil)

    newsletters.each do |newsletter|
      subscribers = Content::Subscriber.where(account_id: newsletter.account_id)

      next if subscribers.empty?

      Content::NewsletterJob.perform_later(newsletter)
    end
  end
end
