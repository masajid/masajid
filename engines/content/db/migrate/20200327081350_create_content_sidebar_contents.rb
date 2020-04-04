class CreateContentSidebarContents < ActiveRecord::Migration[6.0]
  def change
    create_table :content_sidebar_contents do |t|
      t.integer :position, index: true
      t.string :title
      t.text :body, null: false
      t.boolean :light_background, default: false
      t.boolean :active, default: true
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
