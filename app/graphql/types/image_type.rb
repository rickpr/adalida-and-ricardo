module Types
  class ImageType < BaseObject
    field :id,          ID,     null: false
    field :name,        String, null: true
    field :description, String, null: true
    field :alt_text,    String, null: true
    field :image_url,   String, null: true

    def image_url
      return '' unless object.image.attached?

      object.raw_service_url
    end
  end
end
