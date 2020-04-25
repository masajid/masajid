class AddHideEmailToContentConfigurations < ActiveRecord::Migration[6.0]
  def change
    add_column :content_configurations, :hide_email, :boolean, null: false, default: true
    add_column :content_configurations, :hide_phone, :boolean, null: false, default: true
  end
end
