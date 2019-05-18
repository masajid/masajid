class CreateContentPages < ActiveRecord::Migration[5.2]
  def change
    create_table :content_pages do |t|
      t.string :name, null: false
      t.text :description
      t.string :permalink, null: false
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.datetime :deleted_at, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
