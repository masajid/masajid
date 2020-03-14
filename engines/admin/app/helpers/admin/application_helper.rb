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
      Content::Message.where(account: current_account, seeing_at: nil).count
    end

    def plural_resource_name(resource_class)
      resource_class.model_name.human(count: 3)
    end

    def options_for_locale(locales: I18n.available_locales)
      locales.reject(&:blank?).map { |locale| [t("shared.locales.#{locale}"), locale.to_s] }
    end

    def nav_item(text:, path:, active:, icon: 'file-text')
      content_tag(:li, class: 'nav-item') do
        link_to(path, class: ['nav-link', active && 'active']) do
          [
            content_tag(:span, nil, data: { feather: icon }),
            text
          ].join.html_safe
        end
      end
    end
  end
end
