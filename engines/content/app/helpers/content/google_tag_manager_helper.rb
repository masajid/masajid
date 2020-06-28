module Content
  module GoogleTagManagerHelper
    extend ActiveSupport::Concern

    included do
      helper_method :google_tag_manager_id, :render_google_tag_manager?
    end

    def google_tag_manager_id
      @google_tag_manager_id ||= Rails.application.credentials.google_tag_manager_id
    end

    def render_google_tag_manager?
      Rails.env.production? && google_tag_manager_id.present? && !current_user&.super_admin?
    end
  end
end
