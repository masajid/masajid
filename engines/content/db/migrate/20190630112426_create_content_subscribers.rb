class CreateContentSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :content_subscribers do |t|
      t.string :email
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
