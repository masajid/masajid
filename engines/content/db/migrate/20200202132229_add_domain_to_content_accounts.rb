class AddDomainToContentAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :content_accounts, :domain, :string
  end
end
