require_dependency 'admin/application_controller'

module Admin
  class ConfigurationsController < ApplicationController
    def update
      service = Admin::AccountsService.new(current_account, configuration_params)

      if service.update
        redirect_to location_after_save, notice: t('admin.configurations.update.success')
      else
        render :edit
      end
    end

    private

    def configuration_params
      params.require(:account).permit(
        :responsable,
        :mosque,
        configuration_attributes: %i[id hide_email hide_phone logo remove_logo],
        seo_content_attributes: [
          :id,
          :meta_title,
          :meta_description,
          translations_attributes: %i[id locale meta_title meta_description]
        ],
        translations_attributes: %i[id locale mosque]
      )
    end

    def location_after_save
      if configuration_params[:translations_attributes].present?
        translations_path(resource: :configuration, resource_id: :edit)
      else
        edit_configuration_url
      end
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
