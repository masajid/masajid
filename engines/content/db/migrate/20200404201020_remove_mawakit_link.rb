class RemoveMawakitLink < ActiveRecord::Migration[6.0]
  def change
    remove_column :content_configurations, :mawaqit_link, :string
  end
end
