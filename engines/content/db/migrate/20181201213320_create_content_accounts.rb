class CreateContentAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :content_accounts do |t|
      t.string :subdomain
      t.string :email
      t.string :mosque
      t.string :responsable
      t.references :content_owner, foreign_key: { to_table: :content_users }
      t.references :content_address, foreign_key: true

      t.timestamps
    end
  end
end
