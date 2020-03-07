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
      I18n.locale == :ar ? 'rtl' : 'ltr'
    end

    def stylesheet
      I18n.locale == :ar ? 'rtl/application' : 'application'
    end
  end
end
