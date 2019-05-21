require_dependency 'admin/application_controller'

module Admin
  class ConfigurationsController < ApplicationController
    def update
      if current_account.update(configuration_params)
        redirect_to edit_configuration_url, notice: 'General configuration were successfully updated.'
      else
        render :edit
      end
    end

    private
      def configuration_params
        params.require(:account).permit(configuration_attributes: [:id, :logo, :theme, :admin_locale, :default_locale, supported_locales: []])
      end
  end
end
