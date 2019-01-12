class AddStatusToContentAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :content_accounts, :status, :integer, default: 0
  end
end
