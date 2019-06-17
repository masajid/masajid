module Admin
  module ApplicationHelper
    def plural_resource_name(resource_class)
      resource_class.model_name.human(count: 2)
    end

    def options_for_locale(locales: I18n.available_locales)
      locales.reject(&:blank?).map { |locale| [t("shared.locales.#{locale}"), locale.to_s] }
    end
  end
end
