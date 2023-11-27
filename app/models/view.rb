class View < ApplicationRecord
  belongs_to :url_link, counter_cache: :view_count
end
