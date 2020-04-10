require_dependency 'admin/application_controller'

module Admin
  class SocialNetworksController < ApplicationController
    before_action :set_social_network

    def update
      if @social_network.update(social_network_params)
        redirect_to edit_social_network_url, notice: 'Social media were successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_social_network
      @social_network = authorize current_account.social_network || current_account.build_social_network
    end

    def social_network_params
      params.require(:social_network).permit(:youtube, :facebook, :google, :twitter, :vimeo, :instagram).merge(account: current_account)
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
