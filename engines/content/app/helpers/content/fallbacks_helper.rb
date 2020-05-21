module Content
  module FallbacksHelper
    extend ActiveSupport::Concern

    included do
      before_action :set_fallbacks
    end

    private

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
