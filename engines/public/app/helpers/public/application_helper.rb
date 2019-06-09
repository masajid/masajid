module Public
  module ApplicationHelper
    def menu_items
      @menu_items ||= Content::Page.scoped_to(current_account).roots
    end

    def social_network
      @social_network ||= current_account.social_network
    end

    def options_for_locale
      current_account.configuration.supported_locales.reject(&:blank?).map { |locale| [t("shared.locales.#{locale}"), locale.to_s] }
    end
  end
end
