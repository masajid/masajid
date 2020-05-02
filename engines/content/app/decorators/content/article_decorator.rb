module Content
  class ArticleDecorator < ApplicationDecorator
    delegate_all

    def video_link
      return if object.video_source.blank?

      if object.video_source == 'youtube'
        "https://www.youtube.com/embed/#{object.video_id}"
      elsif object.video_source == 'vimeo'
        "https://player.vimeo.com/video/#{object.video_id}"
      end
    end

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
