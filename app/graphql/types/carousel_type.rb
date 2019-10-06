module Types
  class CarouselType < BaseObject
    field :id,          ID,          null: false
    field :name,        String,      null: false
    field :description, String,      null: true
    field :images,      [ImageType], null: true
  end
end
