class AddVideoSourceToContentArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :content_articles, :video_source, :string
  end
end
