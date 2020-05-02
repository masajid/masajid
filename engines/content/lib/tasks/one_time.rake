namespace :one_time do
  task migrate_to_video_id: :environment do
    Content::Article.all.each do |article|
      article.update_columns(video_id: article.video_id.split('/').last, video_source: 'youtube') if article.video_id?
    end
  end
end
