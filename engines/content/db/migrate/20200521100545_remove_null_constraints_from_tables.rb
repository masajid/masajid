class RemoveNullConstraintsFromTables < ActiveRecord::Migration[6.0]
  def change
    change_column :content_pages, :name, :string, null: true
    change_column :content_pages, :permalink, :string, null: true

    change_column :content_articles, :title, :string, null: true
    change_column :content_articles, :slug, :string, null: true
    change_column :content_articles, :summary, :string, null: true
    change_column :content_articles, :body, :string, null: true

    change_column :content_sidebar_contents, :body, :string, null: true
  end
end
