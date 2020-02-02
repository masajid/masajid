module Landing
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Pundit
    include Content::AccountsHelper
    include Landing::ControllerHelpers::Locale
    include Landing::ControllerHelpers::SeoContent

    private

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
