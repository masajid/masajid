class CreateContentCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :content_countries do |t|
      t.string :name, limit: 50, null: false, index: true

      # t.timestamps
    end
  end
end
