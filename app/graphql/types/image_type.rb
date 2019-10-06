module Types
  class ImageType < BaseObject
    field :id,          ID,     null: false
    field :name,        String, null: true
    field :description, String, null: true
    field :alt_text,    String, null: true
    field :image_url,   String, null: true

    def image_url
      return '' unless object.image.attached?

      Rails.application.routes.url_helpers.rails_blob_url(object.image)
    end
  end
end
