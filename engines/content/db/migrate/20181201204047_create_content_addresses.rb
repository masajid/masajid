class CreateContentAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :content_addresses do |t|
      t.string :street
      t.string :zipcode
      t.string :phone
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :content_city, foreign_key: true
      t.references :content_region, foreign_key: true
      t.references :content_country, foreign_key: true

      t.timestamps
    end
  end
end
