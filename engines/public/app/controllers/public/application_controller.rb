module Public
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale

    def current_account
      @current_account ||= request.env['Detectify-Entity']
    end
    helper_method :current_account

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
  end
end
