class AddMawaqitLinkToContentConfigurations < ActiveRecord::Migration[6.0]
  def change
    add_column :content_configurations, :mawaqit_link, :string
  end
end
