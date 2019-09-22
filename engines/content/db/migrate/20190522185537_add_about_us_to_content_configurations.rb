class AddAboutUsToContentConfigurations < ActiveRecord::Migration[6.0]
  def change
    add_column :content_configurations, :about_us, :text
  end
end
