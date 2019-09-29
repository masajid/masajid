require_dependency 'public/application_controller'

module Public
  class ArticlesController < ApplicationController
    def show
      @article = Content::Article.scoped_to(current_account).friendly.find(params[:id])
    end

    private
      def put_site_name_in_title?
        true
      end

      def accurate_title
        return super unless @article

        @article.meta_title.present? ? @article.meta_title : @article.title
      end
  end
end
