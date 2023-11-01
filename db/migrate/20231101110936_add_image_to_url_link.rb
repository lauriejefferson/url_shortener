class AddImageToUrlLink < ActiveRecord::Migration[7.0]
  def change
    add_column :url_links, :image, :string
  end
end
