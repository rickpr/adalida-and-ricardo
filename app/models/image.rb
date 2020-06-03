class Image < ApplicationRecord
  belongs_to :container, polymorphic: true
  acts_as_list scope: :container, top_of_list: 0
  has_one_attached :image

  def raw_service_url(image_variant_name)
    if Rails.env.development? || Rails.env.test?
      Rails.application.routes.url_helpers.rails_blob_url(image)
    else
      variant = image_variants(image_variant_name)
      URI(variant.processed.service_url).tap { |service_url| service_url.query = '' }
    end
  end

  def image_variants(name)
    {
      original: image.variant({}),
      thumbnail: image.variant(resize_to_limit: [400, 300]),
      preview: image.variant(resize_to_limit: [800, 600]),
    }.fetch(name, image)
  end
end
