class AddRoleToContentUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :content_users, :role, :string, null: false
  end
end
