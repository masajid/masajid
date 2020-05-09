require_dependency 'admin/application_controller'

module Admin
  class SlidersController < ApplicationController
    before_action :set_slider

    def update
      if @slider.update(slider_params)
        redirect_to location_after_save, notice: 'Slider was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_slider
      @slider = authorize current_account.slider || current_account.build_slider
    end

    def slider_params
      params.require(:slider).permit(
        :title,
        :body,
        :photo,
        :remove_photo,
        :link,
        :link_text,
        translations_attributes: %i[id locale title body link link_text]
      ).merge(account: current_account)
    end

    def location_after_save
      if slider_params[:translations_attributes].present?
        translations_path(resource: :slider, resource_id: :edit)
      else
        edit_slider_url
      end
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
