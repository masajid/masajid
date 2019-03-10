class CreateContentCities < ActiveRecord::Migration[5.2]
  def change
    create_table :content_cities do |t|
      t.string :name, limit: 50, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.references :country, null: false, index: true
      t.references :region, null: false, index: true

      # t.timestamps
    end
  end
end
