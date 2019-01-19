require_dependency 'admin/application_controller'

module Admin
  class CountriesController < ApplicationController
    before_action :set_country, only: %i[edit update destroy]

    def index
      @countries = Content::Country.all
    end

    def new
      @country = Content::Country.new
    end

    def create
      @country = Content::Country.new(country_params)

      if @country.save
        redirect_to countries_url, notice: 'Country was successfully created.'
      else
        render :new
      end
    end

    def update
      if @country.update(country_params)
        redirect_to countries_url, notice: 'Country was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @country.destroy
      redirect_to countries_url, notice: 'Country was successfully destroyed.'
    end

    private
      def set_country
        @country = Content::Country.find(params[:id])
      end

      def country_params
        params.require(:country).permit(:name)
      end
  end
end
