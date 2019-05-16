class AddAncestryToContentPages < ActiveRecord::Migration[5.2]
  def change
    add_column :content_pages, :ancestry, :string
    add_index :content_pages, :ancestry
  end
end
