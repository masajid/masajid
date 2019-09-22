require_dependency 'admin/application_controller'

module Admin
  class SlidersController < ApplicationController
    before_action :set_slider

    def update
      if @slider.update(slider_params)
        redirect_to edit_slider_url, notice: 'Slider was successfully updated.'
      else
        render :edit
      end
    end

    private
      def set_slider
        @slider = authorize current_account.slider || current_account.build_slider
      end

      def slider_params
        params.require(:slider).permit(:title, :body, :photo, :link, :link_text).merge(account: current_account)
      end
  end
end
