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

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || '/admin'
    end

    def google_analytics_tracking_id
      @google_analytics_tracking_id ||= ENV['GOOGLE_ANALYTICS_TRACKING_ID']
    end
    helper_method :google_analytics_tracking_id

    def render_google_analytics?
      Rails.env.production? && google_analytics_tracking_id.present?
    end
    helper_method :render_google_analytics?
  end
end
