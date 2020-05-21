module Admin
  module Locale
    extend ActiveSupport::Concern

    included do
      before_action :set_locale
    end

    private

    def set_locale
      I18n.locale = current_account&.admin_locale.presence || I18n.default_locale
    end
  end
end
