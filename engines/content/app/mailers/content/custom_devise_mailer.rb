module Content
  class CustomDeviseMailer < Devise::Mailer
    default template_path: 'devise/mailer'
    layout 'mailer'
  end
end