require_dependency 'admin/application_controller'

module Admin
  class RegionsController < ApplicationController
    before_action :set_region, only: %i[edit update destroy]

    def index
      authorize Content::Region

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
    end

    def new
      @region = authorize Content::Region.new
    end

    def create
      @region = authorize Content::Region.new(region_params)

      if @region.save
        redirect_to regions_url, notice: 'Region was successfully created.'
      else
        render :new
      end
    end

    def update
      if @region.update(region_params)
        redirect_to regions_url, notice: 'Region was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @region.destroy
      redirect_to regions_url, notice: 'Region was successfully destroyed.'
    end

    private
      def set_region
        @region = authorize Content::Region.find(params[:id])
      end

      def region_params
        params.require(:region).permit(:name, :code, :adm1code, :country_id)
      end
  end
end
