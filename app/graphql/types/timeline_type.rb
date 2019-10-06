module Types
  class TimelineType < BaseObject
    field :id,             ID,                 null: false
    field :name,           String,             null: true
    field :timeline_posts, [TimelinePostType], null: true
  end
end
