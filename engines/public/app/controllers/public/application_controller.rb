module Public
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Pundit
    include Content::GoogleTagManagerHelper
    include Public::ControllerHelpers::Locale
    include Public::ControllerHelpers::SeoContent

    layout :set_layout

    def current_account
      @current_account ||= request.env['Detectify-Entity']
    end
    helper_method :current_account

    private
      def set_layout
        I18n.locale == :ar ? 'public/rtl/application' : 'public/application'
      end
  end
end
