class RemoveShortCodeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :url_links, :short_code
  end
end
