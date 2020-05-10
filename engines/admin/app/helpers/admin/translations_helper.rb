module Admin
  module TranslationsHelper
    def locales_for_translations
      @locales_for_translations ||= current_account.supported_locales.reject(&:blank?)
    end
  end
end
