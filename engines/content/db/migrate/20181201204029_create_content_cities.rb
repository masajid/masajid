class CreateContentCities < ActiveRecord::Migration[5.2]
  def change
    create_table :content_cities do |t|
      t.string :name, limit: 45, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.string :timezone, limit: 10, null: false
      t.integer :dma_id
      t.string :county, limit: 25
      t.string :code, limit: 4
      t.references :country, null: false, index: true
      t.references :region, null: false, index: true

      # t.timestamps
    end
  end
end
