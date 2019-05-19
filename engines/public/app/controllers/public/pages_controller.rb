require_dependency 'public/application_controller'

module Public
  class PagesController < ApplicationController
    def show
      @page = Content::Page.scoped_to(current_account).find_by!(permalink: params[:id])
      @articles = @page.articles
    end
  end
end
