module Public
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Pundit
    include Public::ControllerHelpers::Locale
    include Public::ControllerHelpers::SeoContent

    def current_account
      @current_account ||= request.env['Detectify-Entity']
    end
    helper_method :current_account
  end
end
