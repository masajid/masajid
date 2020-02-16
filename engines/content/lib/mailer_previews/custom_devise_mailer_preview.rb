class CustomDeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    Content::CustomDeviseMailer.confirmation_instructions(Content::User.last, SecureRandom.hex(20))
  end

  def reset_password_instructions
    Content::CustomDeviseMailer.reset_password_instructions(Content::User.last, SecureRandom.hex(20))
  end

  def unlock_instructions
    Content::CustomDeviseMailer.unlock_instructions(Content::User.last, SecureRandom.hex(20))
  end

  def email_changed
    Content::CustomDeviseMailer.email_changed(Content::User.last)
  end

  def password_change
    Content::CustomDeviseMailer.password_change(Content::User.last)
  end
end
