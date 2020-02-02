class AccountMailerPreview < ActionMailer::Preview
  def notify_creation_new_entry
    Content::AccountMailer.notify_creation_new_entry(Content::Account.last)
  end

  def accept_entry
    Content::AccountMailer.accept_entry(Content::Account.last, SecureRandom.hex(10))
  end

  def decline_entry
    Content::AccountMailer.decline_entry(Content::Account.last)
  end
end
