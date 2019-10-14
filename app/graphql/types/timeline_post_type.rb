module Types
  class TimelinePostType < BaseObject
    field :id,             ID,           null: false
    field :timeline,       TimelineType, null: false
    field :carousel,       CarouselType, null: false
    field :title,          String,       null: true
    field :description,    String,       null: true
    field :body,           String,       null: true
    field :date,           String,       null: true
    field :image_url,      String,       null: true

    def image_url
      return '' unless object.image.attached?

      Rails.application.routes.url_helpers.rails_blob_url(object.image)
    end
  end
end
