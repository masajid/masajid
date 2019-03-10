require_dependency 'admin/application_controller'

module Admin
  class CitiesController < ApplicationController
    before_action :set_city, only: %i[edit update destroy]

    def index
      authorize Content::City

      @countries = policy_scope(Content::Country)

      @regions = policy_scope(Content::Region).where(
        {}.tap do |conditions|
          if params[:country_id]
            conditions[:country_id] = params[:country_id]
          else
            conditions[:country] = @countries.first
          end
        end
      )

      @cities = policy_scope(Content::City).where(
        {}.tap do |conditions|
          if params[:region_id].present?
            conditions[:region_id] = params[:region_id]
          else
            conditions[:region] = @regions.first
          end
        end
      )
    end

    def new
      @city = authorize Content::City.new
    end

    def create
      @city = authorize Content::City.new(city_params)

      if @city.save
        redirect_to cities_url, notice: 'City was successfully created.'
      else
        render :new
      end
    end

    def update
      if @city.update(city_params)
        redirect_to @city, notice: 'City was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @city.destroy
      redirect_to cities_url, notice: 'City was successfully destroyed.'
    end

    private
      def set_city
        @city = authorize Content::City.find(params[:id])
      end

      def city_params
        params.require(:city).permit(:name, :latitude, :longitude, :country_id, :region_id)
      end
  end
end
