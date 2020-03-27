class CreateContentMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :content_messages do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :body, null: false
      t.boolean :newsletter, default: false
      t.datetime :seen_at
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
