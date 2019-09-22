class CreateContentSliders < ActiveRecord::Migration[6.0]
  def change
    create_table :content_sliders do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :link_text
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
