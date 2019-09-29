class CreateContentSeoContents < ActiveRecord::Migration[6.0]
  def change
    create_table :content_seo_contents do |t|
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.references :searchable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
