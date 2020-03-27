module Landing
  module ControllerHelpers
    module Locale
      extend ActiveSupport::Concern

      included do
        around_action :switch_locale
      end

      private

      def default_url_options
        { locale: I18n.locale }
      end

      def switch_locale(&action)
        locale =
          if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
            params[:locale]
          elsif I18n.available_locales.include?(extract_locale_from_accept_language_header)
            extract_locale_from_accept_language_header
          else
            I18n.default_locale
          end

        I18n.with_locale(locale, &action)
      end

      def extract_locale_from_accept_language_header
        request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first&.to_sym
      end
    end
  end
end
