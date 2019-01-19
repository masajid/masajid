require_dependency 'admin/application_controller'

module Admin
  class CitiesController < ApplicationController
    before_action :set_city, only: %i[edit update destroy]

    def index
      @countries = Content::Country.all

      @regions =
        if params[:country_id].present?
          @countries.find(params[:country_id]).regions
        else
          @countries.first.regions
        end

      @cities =
        if params[:region_id].present?
          @regions.find(params[:region_id]).cities
        else
          @regions.first.cities
        end
    end

    def new
      @city = Content::City.new
    end

    def create
      @city = Content::City.new(city_params)

      if @city.save
        redirect_to @city, notice: 'City was successfully created.'
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
        @city = Content::City.find(params[:id])
      end

      def city_params
        params.require(:city).permit(:name, :latitude, :longitude, :timezone, :dma_id, :county, :code, :country_id, :region_id)
      end
  end
end
