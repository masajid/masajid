module Public
  module ControllerHelpers
    module Locale
      extend ActiveSupport::Concern

      included do
        before_action :set_locale
        before_action :set_fallbacks
      end

      private

      def default_url_options
        { locale: I18n.locale }
      end

      def set_locale
        I18n.locale =
          if params[:locale].present? && current_account.supported_locales.include?(params[:locale])
            params[:locale]
          else
            current_account.default_locale.presence || I18n.default_locale
          end
      end

      def set_fallbacks
        Globalize.fallbacks = {
          I18n.locale => [
            I18n.locale,
            *current_account.supported_locales.reject { |locale| locale.blank? || locale == I18n.locale.to_s }
          ]
        }
      end
    end
  end
end
