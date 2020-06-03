module Types
  class ImageType < BaseObject
    field :id,                 ID,     null: false
    field :name,               String, null: true
    field :description,        String, null: true
    field :alt_text,           String, null: true
    field :image_url,          String, null: true
    field :original_image_url, String, null: true
    field :thumbnail_url,      String, null: true

    def image_url
      image_variant_url(:preview)
    end

    def original_image_url
      image_variant_url(:original)
    end

    def thumbnail_url
      image_variant_url(:thumbnail)
    end

    private

    def image_variant_url(variant_name)
      object.image.attached? ? object.raw_service_url(variant_name) : ''
    end
  end
end
