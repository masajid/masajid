class DropContentPhotos < ActiveRecord::Migration[6.0]
  def change
    drop_table :content_photos do |t|
      t.text :image_data

      t.timestamps
    end
  end
end
