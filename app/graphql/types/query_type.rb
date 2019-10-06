module Types
  class QueryType < Types::BaseObject
    field :timelines, [TimelineType], null: false do
      argument :id, ID, required: false
    end

    def timelines(id: nil)
      id ? Timeline.where(id: id) : Timeline.all
    end
  end
end
