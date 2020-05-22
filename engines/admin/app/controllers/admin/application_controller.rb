module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    include Pundit
    include Admin::Locale
    include Content::FallbacksHelper
    include Content::GoogleTagManagerHelper
    include Content::LayoutHelper
    include Content::AccountsHelper

    rescue_from Pundit::NotAuthorizedError do
      redirect_to root_path, alert: t('admin.pundit.unauthorized')
    end

    def current_account
      @current_account ||= current_user.account
    end
    helper_method :current_account
  end
end
