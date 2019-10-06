class TimelinePost < ApplicationRecord
  belongs_to :timeline
  belongs_to :carousel
  has_one_attached :image

  before_create :create_carousel!

  private

  def create_carousel!
    self.carousel ||= Carousel.create!
  end
end
