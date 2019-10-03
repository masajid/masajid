module Content
  class ArticleDecorator < ApplicationDecorator
    delegate_all

    def published_at
      object.published_at.to_formatted_s(:long)
    end

    def published_on
      object.published_at.to_date.to_formatted_s(:long)
    end

    def views_count
      Ahoy::Event.where_event(Content::Article::VIEWS_TRACKING_EVENT_NAME, id: object.id).count
    end
  end
end
