require_dependency 'public/application_controller'

module Public
  class VideosController < ApplicationController
    def index
      # @videos = Video.scoped_to(current_account)
      # Video must have account_id column
    end

    def show
      # @video = Video.scoped_to(current_account).find(params[:id])
    end
  end
end
