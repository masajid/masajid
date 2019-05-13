module Public
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_account
      @current_account ||= request.env['Detectify-Entity']
    end
    helper_method :current_account
  end
end
