module Admin
  class ApplicationController < ActionController::Base
    include Pundit
    include Content::GoogleTagManagerHelper
    include Content::AccountsHelper
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :set_locale

    layout :set_layout

    rescue_from Pundit::NotAuthorizedError do
      redirect_to root_path, alert: t('admin.pundit.unauthorized')
    end

    def current_account
      @current_account ||= current_user.account
    end
    helper_method :current_account

    def current_account_domain
      @current_account_domain ||= current_account && account_domain(current_account)
    end
    helper_method :current_account_domain

    private

    def set_locale
      I18n.locale = current_account&.admin_locale.presence || I18n.default_locale
    end

    def set_layout
      I18n.locale == :ar ? 'admin/rtl/application' : 'admin/application'
    end
  end
end
