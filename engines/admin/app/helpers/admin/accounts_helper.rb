module Admin
  module AccountsHelper
    def account_class_name_status(status)
      if status == 'pending'
        'active'
      elsif status == 'accepted'
        'success'
      elsif status == 'declined'
        'danger'
      end
    end
  end
end
