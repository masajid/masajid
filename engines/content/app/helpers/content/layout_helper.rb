module Content
  module LayoutHelper
    extend ActiveSupport::Concern

    included do
      helper_method :lang, :dir, :stylesheet
    end

    def lang
      I18n.locale
    end

    def dir
      rtl_layout? ? 'rtl' : 'ltr'
    end

    def stylesheet
      rtl_layout? ? 'rtl/application' : 'application'
    end

    private

    def rtl_layout?
      %i[ar fa ur].include?(I18n.locale)
    end
  end
end
