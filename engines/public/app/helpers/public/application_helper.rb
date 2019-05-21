module Public
  module ApplicationHelper
    def current_configuration
      @current_configuration ||= current_account.configuration
    end

    def social_network
      @social_network ||= current_account.social_network
    end
  end
end
