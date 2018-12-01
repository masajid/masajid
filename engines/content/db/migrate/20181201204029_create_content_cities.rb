class CreateContentCities < ActiveRecord::Migration[5.2]
  def change
    create_table :content_cities do |t|
      t.string :name
      t.references :content_region, foreign_key: true

      t.timestamps
    end
  end
end
