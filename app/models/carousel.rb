class Carousel < ApplicationRecord
  has_many :timeline_posts, dependent: :nullify
  has_many :timelines, through: :timeline_posts
  has_many :images, -> { order(:position) }, as: :container
end
