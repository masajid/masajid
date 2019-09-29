class CreateContentConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :content_configurations do |t|
      t.string :theme, null: false, default: 'default'
      t.string :supported_locales, array: true, default: []
      t.string :default_locale
      t.string :admin_locale
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
