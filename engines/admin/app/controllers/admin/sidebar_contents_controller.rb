require_dependency 'admin/application_controller'

module Admin
  class SidebarContentsController < ApplicationController
    before_action :set_sidebar_content, only: %i[edit update destroy]

    def index
      authorize Content::SidebarContent

      @sidebar_contents = policy_scope(Content::SidebarContent)
    end

    def new
      @sidebar_content = authorize Content::SidebarContent.new
    end

    def create
      @sidebar_content = authorize Content::SidebarContent.new(sidebar_content_params)

      if @sidebar_content.save
        redirect_to edit_sidebar_content_url(@sidebar_content), notice: 'Sidebar Content was successfully created.'
      else
        render :new
      end
    end

    def update
      if @sidebar_content.update(sidebar_content_params)
        redirect_to edit_sidebar_content_url(@sidebar_content), notice: 'Sidebar Content was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sidebar_content.destroy
      redirect_to sidebar_contents_url, notice: 'Sidebar Content was successfully deleted.'
    end

    private

    def set_sidebar_content
      @sidebar_content = authorize Content::SidebarContent.find(params[:id])
    end

    def sidebar_content_params
      params.require(:sidebar_content).permit(:title, :body, :link, :light_background, :active).merge(account: current_account)
    end
  end
end
