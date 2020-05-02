require_dependency 'admin/application_controller'

module Admin
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[edit update destroy]

    def index
      authorize Content::Article

      @articles = policy_scope(Content::Article).includes(:pages).paginate(page: params[:page], per_page: 20).decorate
    end

    def new
      @article = authorize Content::Article.new
    end

    def create
      @article = authorize Content::Article.new(article_params)

      if @article.save
        redirect_to edit_article_url(@article), notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to edit_article_url(@article), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    def set_article
      @article = authorize Content::Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(
        :title,
        :slug,
        :summary,
        :body,
        :video_source,
        :video_id,
        :published_at,
        :photo,
        :remove_photo,
        seo_content_attributes: %i[id meta_title meta_description],
        page_ids: []
      ).merge(account: current_account)
    end

    def wrapper_center?
      action_name != 'index'
    end
    helper_method :wrapper_center?
  end
end
