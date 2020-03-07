module Landing
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Pundit
    include Content::GoogleTagManagerHelper
    include Landing::ControllerHelpers::Locale
    include Landing::ControllerHelpers::SeoContent

    layout :set_layout

    private

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || '/admin'
    end

    def set_layout
      I18n.locale == :ar ? 'landing/rtl/application' : 'landing/application'
    end
  end
end
