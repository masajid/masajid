module Admin
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :set_locale

    rescue_from Pundit::NotAuthorizedError do
      redirect_to root_path, alert: t('admin.pundit.unauthorized')
    end

    def current_account
      @current_account ||= current_user.account
    end
    helper_method :current_account

    private
      def set_locale
        I18n.locale = current_account&.admin_locale.presence || I18n.default_locale
      end
  end
end
