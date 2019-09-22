class CreateContentSocialNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :content_social_networks do |t|
      t.string :youtube
      t.string :facebook
      t.string :google
      t.string :twitter
      t.string :vimeo
      t.string :instagram
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
