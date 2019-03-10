class CreateContentRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :content_regions do |t|
      t.string :name, limit: 50, null: false
      t.references :country, null: false, index: true

      # t.timestamps
    end
  end
end
