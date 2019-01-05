class CreateContentAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :content_accounts do |t|
      t.string :subdomain
      t.string :email
      t.string :mosque
      t.string :responsable
      t.references :owner, null: false, index: true

      t.timestamps
    end
  end
end
