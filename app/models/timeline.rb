class Timeline < ApplicationRecord
  has_many :timeline_posts, dependent: :destroy
  has_many :carousels, through: :timeline_posts
end
