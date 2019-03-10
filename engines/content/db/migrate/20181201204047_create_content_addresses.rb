class CreateContentAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :content_addresses do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :phone, limit: 20, null: false
      t.string :mobile, limit: 20
      t.string :fax, limit: 20
      t.string :address1, null: false
      t.string :address2
      t.string :zip_code, limit: 20
      t.string :city_name, limit: 50, null: false
      t.string :region_name, limit: 50, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.references :addressable, polymorphic: true, index: true, null: false
      t.references :city, index: true
      t.references :region, index: true
      t.references :country, null: false, index: true

      t.timestamps
    end
  end
end
