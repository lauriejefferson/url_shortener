class ChangeViewCountInUrlLink < ActiveRecord::Migration[7.0]
  def change
    change_column :url_links, :view_count, 'integer USING CAST(view_count AS integer)'
  end
end
