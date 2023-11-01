class UrlLink < ApplicationRecord
  scope :recent_first, -> {order(created_at: :desc)}

  validates :url, presence: true
end
