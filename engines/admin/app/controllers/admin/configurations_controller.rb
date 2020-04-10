require_dependency 'admin/application_controller'

module Admin
  class ConfigurationsController < ApplicationController
    def update
      if current_account.update(configuration_params)
        uploaded_logo = params.dig(:account, :configuration_attributes, :logo)
        current_account.configuration.logo.attach(uploaded_logo) if uploaded_logo.present?
        redirect_to location_after_save, notice: notice_after_save
      else
        render :edit
      end
    end

    private

    def configuration_params
      params.require(:account).permit(
        :domain,
        configuration_attributes: [
          :id,
          :logo,
          :about_us,
          :mawaqit_link,
          :theme,
          :admin_locale,
          :default_locale,
          supported_locales: []
        ],
        seo_content_attributes: %i[
          id
          meta_title
          meta_description
        ]
      )
    end

    def location_after_save
      if configuration_params[:domain]
        edit_domain_url
      else
        edit_configuration_url
      end
    end

    def notice_after_save
      if configuration_params[:domain]
        t('admin.configurations.update.domain_success_message')
      else
        t('admin.configurations.update.success')
      end
    end
  end
end
