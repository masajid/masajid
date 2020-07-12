class AddAuthenticationTokenToContentUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :content_users, :authentication_token, :string
  end
end
