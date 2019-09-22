module Content
  class CustomDeviseMailer < Devise::Mailer
    default template_path: 'devise/mailer'

    def confirmation_instructions(record, token, opts={})
      @account = record.account
      super
    end
  end
end