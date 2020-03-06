class RemoveAboutUsFromContentConfigurations < ActiveRecord::Migration[6.0]
  def change
    remove_column :content_configurations, :about_us, :text
  end
end
