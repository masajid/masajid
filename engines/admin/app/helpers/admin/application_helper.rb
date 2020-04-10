module Admin
  module ApplicationHelper
    def title
      return t('shared.site_name') if current_account.blank?

      [
        current_account.mosque,
        t('shared.site_name')
      ].join(' - ')
    end

    def unread_messages
      policy_scope(Content::Message).not_seeing.count
    end

    def plural_resource_name(resource_class)
      resource_class.model_name.human(count: 3)
    end

    def options_for_locale(locales: I18n.available_locales)
      locales.reject(&:blank?).map { |locale| [t("shared.locales.#{locale}"), locale.to_s] }
    end

    def nav_item(text:, path:, active:, icon: 'file-text')
      content_tag(:li, class: active && 'active') do
        link_to(path) do
          [
            content_tag(:span, nil, data: { feather: icon }),
            text
          ].join.html_safe
        end
      end
    end

    def settings_submenu_active?
      [
        '/admin/configuration/edit',
        '/admin/language/edit',
        '/admin/social_network/edit',
        '/admin/slider/edit',
        '/admin/sidebar',
        '/admin/countries'
      ].one? { |path| request.path.start_with?(path) }
    end

    def wrapper_center?
      false
    end
  end
end
