class AddPositionToContentPages < ActiveRecord::Migration[5.2]
  def change
    add_column :content_pages, :position, :integer
    add_index :content_pages, :position
  end
end
