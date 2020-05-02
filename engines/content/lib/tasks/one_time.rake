namespace :one_time do
  task migrate_to_video_id: :environment do
    Content::Article.all.each do |article|
      if article.video_id?
        article.update_columns(video_id: article.video_id.split('/').last, video_source: 'youtube')
        article.photo.purge if article.photo.attached?
      end
    end
  end
end
