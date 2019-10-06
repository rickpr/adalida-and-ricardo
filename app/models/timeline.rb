class Timeline < ApplicationRecord
  has_many :timeline_posts
  has_many :carousels, through: :timeline_posts
end
