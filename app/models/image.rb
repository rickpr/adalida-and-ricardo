class Image < ApplicationRecord
  belongs_to :container, polymorphic: true
  has_one_attached :image

  def raw_service_url
    URI(image.service_url).tap { |service_url| service_url.query = '' }
  end
end
