module Public
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Pundit
    include Public::SeoContent
    include Public::Locale
    include Content::FallbacksHelper
    include Content::GoogleTagManagerHelper
    include Content::LayoutHelper

    def current_account
      @current_account ||= request.env['Detectify-Entity']
    end
    helper_method :current_account
  end
end
