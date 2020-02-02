require_dependency 'admin/application_controller'

module Admin
  class ConfigurationsController < ApplicationController
    def update
      if current_account.update(configuration_params)
        uploaded_logo = params.dig(:account, :configuration_attributes, :logo)
        current_account.configuration.logo.attach(uploaded_logo) if uploaded_logo.present?
        redirect_to edit_configuration_url, notice: 'General configuration were successfully updated.'
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

    def default_account_account_domain
      @default_account_account_domain ||= current_account && default_account_domain(current_account)
    end
    helper_method :default_account_account_domain
  end
end
