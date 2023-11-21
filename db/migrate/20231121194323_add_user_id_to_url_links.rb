class AddUserIdToUrlLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :url_links, :user_id, :integer
  end
end
