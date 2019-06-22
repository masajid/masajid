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
        params.require(:account).permit(
          configuration_attributes: [:id, :logo, :about_us, :theme, :admin_locale, :default_locale, supported_locales: []],
          seo_content_attributes: [:id, :meta_title, :meta_description],
        )
      end
  end
end
