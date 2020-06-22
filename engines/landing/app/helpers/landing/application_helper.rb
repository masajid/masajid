module Landing
  module ApplicationHelper
    LOCALE_ICON_MAPPING = {
      'ar' => 'sa',
      'ca' => 'es-ct',
      'en' => 'us',
      'fa' => 'ir',
      'ur' => 'pk'
    }.freeze

    def locale_with_icon(locale)
      icon_suffix = LOCALE_ICON_MAPPING[locale.to_s] || locale

      icon = content_tag(
        :span,
        nil,
        class: "flag-icon flag-icon-#{icon_suffix}"
      )

      [icon, t("shared.locales.#{locale}")].join(' ').html_safe
    end

    def alternate_locales
      I18n.available_locales.reject { |locale| locale == I18n.locale.to_sym }
    end
  end
end
