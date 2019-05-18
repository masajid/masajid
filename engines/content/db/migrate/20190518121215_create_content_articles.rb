class CreateContentArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :content_articles do |t|
      t.string :title, null: false, index: true
      t.string :slug, null: false, index: { unique: true }
      t.text :summary, null: false
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_descripton
      t.datetime :published_at, index: true
      t.datetime :deleted_at, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
