class Image < ApplicationRecord
  belongs_to :container, polymorphic: true
  acts_as_list scope: :container, top_of_list: 0
  has_one_attached :image

  def raw_service_url
    if Rails.env.development? || Rails.env.test?
      Rails.application.routes.url_helpers.rails_blob_url(image)
    else
      URI(image.service_url).tap { |service_url| service_url.query = '' }
    end
  end
end
