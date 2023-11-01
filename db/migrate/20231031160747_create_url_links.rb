class CreateUrlLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :url_links do |t|
      t.string :url
      t.string :short_code
      t.string :view_count
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
