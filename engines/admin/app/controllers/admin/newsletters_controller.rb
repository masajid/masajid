require_dependency 'admin/application_controller'

module Admin
  class NewslettersController < ApplicationController
    before_action :set_newsletter, only: %i[edit update destroy]

    def index
      authorize Content::Newsletter

      @newsletters = policy_scope(Content::Newsletter)
    end

    def new
      @newsletter = authorize Content::Newsletter.new
    end

    def create
      @newsletter = authorize Content::Newsletter.new(newsletter_params)

      if @newsletter.save
        redirect_to edit_newsletter_url(@newsletter), notice: 'Newsletter was successfully created.'
      else
        render :new
      end
    end

    def update
      if @newsletter.update(newsletter_params)
        redirect_to edit_newsletter_url(@newsletter), notice: 'Newsletter was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @newsletter.destroy
      redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.'
    end

    private

    def set_newsletter
      @newsletter = authorize Content::Newsletter.find(params[:id])
    end

    def newsletter_params
      params.require(:newsletter).permit(:subject, :body, :link, :link_text, :date, :photo, :remove_photo, article_ids: []).merge(account: current_account)
    end
  end
end
