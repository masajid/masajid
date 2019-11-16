require_dependency 'public/application_controller'

module Public
  class ArticlesController < ApplicationController
    before_action :set_article
    before_action :track_show

    private

    def set_article
      @article = Content::Article.scoped_to(current_account).friendly.find(params[:id]).decorate
    end

    def track_show
      ahoy.track(Content::Article::VIEWS_TRACKING_EVENT_NAME, id: @article.id)
    end

    def put_site_name_in_title?
      true
    end

    def accurate_title
      return super unless @article

      @article.meta_title.present? ? @article.meta_title : @article.title
    end
  end
end
