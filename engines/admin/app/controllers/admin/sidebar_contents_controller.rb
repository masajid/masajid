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
        redirect_to location_after_save, notice: t('admin.sidebar_contents.create.success')
      else
        render :new
      end
    end

    def update
      if @sidebar_content.update(sidebar_content_params)
        redirect_to location_after_save, notice: t('admin.sidebar_contents.update.success')
      else
        render :edit
      end
    end

    def destroy
      @sidebar_content.destroy
      redirect_to sidebar_contents_url, notice: t('admin.sidebar_contents.destroy.success')
    end

    private

    def set_sidebar_content
      @sidebar_content = authorize Content::SidebarContent.find(params[:id])
    end

    def sidebar_content_params
      params.require(:sidebar_content).permit(
        :title,
        :body,
        :light_background,
        :active,
        translations_attributes: %i[id locale title body]
      ).merge(account: current_account)
    end

    def location_after_save
      if sidebar_content_params[:translations_attributes].present?
        translations_path(resource: :sidebar, resource_id: @sidebar_content.id)
      else
        edit_sidebar_content_url(@sidebar_content)
      end
    end

    def wrapper_center?
      action_name != 'index'
    end
    helper_method :wrapper_center?
  end
end
