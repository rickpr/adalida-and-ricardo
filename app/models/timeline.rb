class Timeline < ApplicationRecord
  has_many :timeline_posts, -> { order(:position) }, dependent: :destroy
  has_many :carousels, through: :timeline_posts
end
