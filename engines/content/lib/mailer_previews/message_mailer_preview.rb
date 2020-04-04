class MessageMailerPreview < ActionMailer::Preview
  def user_email
    Content::MessageMailer.user_email(Content::Message.last)
  end
end
