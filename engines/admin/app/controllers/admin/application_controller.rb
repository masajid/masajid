module Admin
  class ApplicationController < ActionController::Base
    include Pundit
    include Admin::Locale
    include Content::FallbacksHelper
    include Content::GoogleTagManagerHelper
    include Content::LayoutHelper
    include Content::AccountsHelper

    protect_from_forgery with: :exception

    before_action :authenticate_user!

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
  end
end
