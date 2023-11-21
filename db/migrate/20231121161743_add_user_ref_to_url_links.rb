class AddUserRefToUrlLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :url_links, :user, foreign_key: true
  end
end
