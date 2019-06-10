module Landing
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    before_action :set_locale

    private
      def default_url_options
        { locale: I18n.locale }
      end

      def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
      end
  end
end
