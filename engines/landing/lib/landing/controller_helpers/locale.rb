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
          else
            extract_locale_from_accept_language_header
          end

        I18n.with_locale(locale, &action)
      end

      def extract_locale_from_accept_language_header
        request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first || I18n.default_locale
      end
    end
  end
end
