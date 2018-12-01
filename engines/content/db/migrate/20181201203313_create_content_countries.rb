class CreateContentCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :content_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
