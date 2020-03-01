class RemoveEmailFromContentAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :content_accounts, :email
  end
end
