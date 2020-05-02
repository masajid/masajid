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

    def displayed_photo(main_app, resize:)
      if object.photo.attached?
        main_app.url_for(object.photo.variant(resize: resize))
      elsif object.video_source == 'youtube'
        "https://img.youtube.com/vi/#{object.video_id}/mqdefault.jpg"
      elsif object.video_source == 'vimeo'
        "https://i.vimeocdn.com/video/#{object.video_id}_300.jpg"
      else
        'content/articles/default.png'
      end
    end

    def published_on
      I18n.l(object.published_at.to_date, format: :long)
    end

    def views_count
      Ahoy::Event.where_event(Content::Article::VIEWS_TRACKING_EVENT_NAME, id: object.id).count
    end
  end
end
