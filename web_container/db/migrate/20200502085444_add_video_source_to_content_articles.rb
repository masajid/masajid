class AddVideoSourceToContentArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :content_articles, :video_link, :video_id
    add_column :content_articles, :video_source, :string
  end
end
