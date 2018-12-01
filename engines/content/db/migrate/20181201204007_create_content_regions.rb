class CreateContentRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :content_regions do |t|
      t.string :name
      t.references :content_country, foreign_key: true

      t.timestamps
    end
  end
end
