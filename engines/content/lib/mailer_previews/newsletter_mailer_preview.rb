class NewsletterMailerPreview < ActionMailer::Preview
  def user_email
    Content::NewsletterMailer.user_email(Content::Newsletter.last, Content::Subscriber.last)
  end
end
