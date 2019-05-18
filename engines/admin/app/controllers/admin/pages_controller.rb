require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController
    protect_from_forgery with: :null_session, only: :sort

    include SortableTreeController::Sort
    sortable_tree 'Content::Page', { parent_method: 'parent', sorting_attribute: 'position' }

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
        redirect_to edit_page_url(@page), notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    def update
      if @page.update(page_params)
        redirect_to edit_page_url(@page), notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
      def set_page
        @page = authorize Content::Page.find(params[:id])
      end
  
      def page_params
        params.require(:page).permit(:name, :description, :ancestry, :permalink_part, :meta_title, :meta_keywords, :meta_description).merge(account: current_account)
      end
  end
end
