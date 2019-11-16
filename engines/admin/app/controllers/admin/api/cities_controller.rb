module Admin
  module Api
    class CitiesController < ActionController::Base
      def index
        @cities =
          if params[:country_id]
            Content::City.where(country_id: params[:country_id])
          elsif params[:region_id]
            Content::City.where(region_id: params[:region_id])
          else
            Content::City.all
          end

        render json: { cities: @cities.map { |city| { id: city.id, name: city.name } } }
      end
    end
  end
end
