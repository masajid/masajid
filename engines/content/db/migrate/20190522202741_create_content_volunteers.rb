class CreateContentVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :content_volunteers do |t|
      t.string :name, null: false
      t.string :identification, null: false
      t.date :birthday, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :education, null: false
      t.text :languages, array: true, default: []
      t.string :other_languages
      t.string :availability, null: false
      t.text :experience, null: false
      t.text :experience_place
      t.text :experience_area, array: true, default: []
      t.references :account, index: true

      t.timestamps
    end
  end
end
