require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController
    protect_from_forgery with: :null_session, only: :sort

    include SortableTreeController::Sort
    sortable_tree 'Content::Page', parent_method: 'parent', sorting_attribute: 'position'

    before_action :set_page, only: %i[edit update destroy]

    def index
      authorize Content::Page

      @pages = policy_scope(Content::Page).arrange(order: :position)
    end

    def new
      @page = authorize Content::Page.new
    end

    def create
      @page = authorize Content::Page.new(page_params)

      if @page.save
        redirect_to location_after_save, notice: t('admin.pages.create.success')
      else
        render :new
      end
    end

    def update
      if @page.update(page_params)
        redirect_to location_after_save, notice: t('admin.pages.update.success')
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to pages_url, notice: t('admin.pages.destroy.success')
    end

    private

    def set_page
      @page = authorize Content::Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(
        :name,
        :description,
        :ancestry,
        :permalink_part,
        seo_content_attributes: [
          :id,
          :meta_title,
          :meta_description,
          translations_attributes: %i[id locale meta_title meta_description]
        ],
        translations_attributes: %i[id locale name description]
      ).merge(account: current_account)
    end

    def location_after_save
      if page_params[:translations_attributes].present?
        translations_path(resource: :pages, resource_id: @page.id)
      else
        edit_page_url(@page)
      end
    end

    def wrapper_center?
      action_name != 'index'
    end
    helper_method :wrapper_center?
  end
end
