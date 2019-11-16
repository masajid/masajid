module Admin
  module Api
    class RegionsController < ActionController::Base
      def index
        @regions =
          if params[:country_id]
            Content::Region.where(country_id: params[:country_id])
          else
            Content::Region.all
          end

        render json: { regions: @regions.map { |region| { id: region.id, name: region.name } } }
      end
    end
  end
end
