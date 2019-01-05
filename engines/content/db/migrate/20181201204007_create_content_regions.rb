class CreateContentRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :content_regions do |t|
      t.string :name, limit: 45, null: false
      t.string :code, limit: 8, null: false
      t.string :adm1code, limit: 4, null: false
      t.references :country, null: false, index: true

      # t.timestamps
    end
  end
end
