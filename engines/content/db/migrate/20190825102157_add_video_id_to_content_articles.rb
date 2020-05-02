class AddVideoIdToContentArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :content_articles, :video_id, :string
  end
end
