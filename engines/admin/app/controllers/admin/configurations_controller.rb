require_dependency 'admin/application_controller'

module Admin
  class ConfigurationsController < ApplicationController
    def update
      if current_account.update(configuration_params)
        uploaded_logo = params.dig(:account, :configuration_attributes, :logo)
        current_account.configuration.logo.attach(uploaded_logo) if uploaded_logo.present?
        redirect_to edit_configuration_url, notice: t('admin.configurations.update.success')
      else
        render :edit
      end
    end

    private

    def configuration_params
      params.require(:account).permit(
        :responsable,
        :mosque,
        configuration_attributes: %i[id logo],
        seo_content_attributes: %i[id meta_title meta_description]
      )
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
