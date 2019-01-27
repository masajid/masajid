module Admin
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    before_action :authenticate_user!

    rescue_from Pundit::NotAuthorizedError do
      redirect_to root_path, alert: t('admin.pundit.unauthorized')
    end
  end
end
