require_dependency 'public/application_controller'

module Public
  class ArticlesController < ApplicationController
    def show
      @article = Content::Article.scoped_to(current_account).friendly.find(params[:id])
    end
  end
end
