require_dependency 'admin/application_controller'

module Admin
  class AboutController < ApplicationController
    before_action :set_configuration

    def update
      if @configuration.update(configuration_params)
        redirect_to edit_about_url, notice: t('admin.about.update.success')
      else
        render :edit
      end
    end

    private

    def configuration_params
      params.require(:configuration).permit(:about_us)
    end

    def set_configuration
      @configuration ||= current_account.configuration || current_account.build_configuration
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
