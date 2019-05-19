class CreateContentPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :content_photos do |t|
      t.text :image_data

      t.timestamps
    end
  end
end
