module Admin
  module ApplicationHelper
    def plural_resource_name(resource_class)
      resource_class.model_name.human(count: 2)
    end

    def options_for_locale(locales: I18n.available_locales)
      locales.reject(&:blank?).map { |locale| [t("shared.locales.#{locale}"), locale.to_s] }
    end

    def nav_item(text:, path:, active:)
      content_tag(:li, class: 'nav-item') do
        link_to(text, path, class: ['nav-link', active && 'active'])
      end
    end
  end
end
