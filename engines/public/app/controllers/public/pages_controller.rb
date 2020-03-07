require_dependency 'public/application_controller'

module Public
  class PagesController < ApplicationController
    def show
      @page = Content::Page.scoped_to(current_account).find_by!(permalink: params[:id])
      @articles = @page.articles.decorate
    end

    private

    def put_site_name_in_title?
      true
    end

    def accurate_title
      return super unless @page

      @page.meta_title.present? ? @page.meta_title : @page.name
    end
  end
end
