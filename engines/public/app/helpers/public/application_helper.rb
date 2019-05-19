module Public
  module ApplicationHelper
    def social_network
      @social_network ||= current_account.social_network
    end
  end
end
