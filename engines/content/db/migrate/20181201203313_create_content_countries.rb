class CreateContentCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :content_countries do |t|
      t.string :name, limit: 50, null: false, index: true
      t.string :fips104, limit: 2, null: false
      t.string :iso2, limit: 2, null: false
      t.string :iso3, limit: 3, null: false
      t.string :ison, limit: 4, null: false
      t.string :internet, limit: 2, null: false
      t.string :capital, limit: 25
      t.string :map_reference, limit: 50
      t.string :nationality_singular, limit: 35
      t.string :nationality_plural, limit: 35
      t.string :currency, limit: 30
      t.string :currency_code, limit: 3
      t.integer :population
      t.string :title, limit: 50
      t.string :comment, limit: 255

      # t.timestamps
    end
  end
end
