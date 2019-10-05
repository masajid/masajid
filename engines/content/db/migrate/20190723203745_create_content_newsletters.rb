class CreateContentNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :content_newsletters do |t|
      t.string :subject
      t.text :body
      t.date :date
      t.string :link
      t.string :link_text
      t.datetime :sent_at
      t.references :account, null: false, index: true

      t.timestamps
    end

    create_table :content_articles_newsletters, id: false do |t|
      t.references :newsletter, null: false, index: true
      t.references :article, null: false, index: true
    end
  end
end
