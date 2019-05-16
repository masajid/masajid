class CreateContentPages < ActiveRecord::Migration[5.2]
  def change
    create_table :content_pages do |t|
      t.string :name, null: false
      t.text :description
      t.string :permalink, null: false
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.references :entity, null: false, index: true

      t.integer :parent_id, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      t.timestamps
    end
  end
end
