require_dependency "admin/application_controller"

module Admin
  class RegionsController < ApplicationController
    before_action :set_region, only: [:show, :edit, :update, :destroy]

    # GET /regions
    def index
      @regions = Content::Region.all
    end

    # GET /regions/1
    def show
    end

    # GET /regions/new
    def new
      @region = Content::Region.new
    end

    # GET /regions/1/edit
    def edit
    end

    # POST /regions
    def create
      @region = Content::Region.new(region_params)

      if @region.save
        redirect_to @region, notice: 'Region was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /regions/1
    def update
      if @region.update(region_params)
        redirect_to @region, notice: 'Region was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /regions/1
    def destroy
      @region.destroy
      redirect_to regions_url, notice: 'Region was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_region
        @region = Content::Region.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def region_params
        params.require(:region).permit(:name, :country_id)
      end
  end
end
