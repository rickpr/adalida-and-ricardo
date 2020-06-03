class TimelinePost < ApplicationRecord
  belongs_to :timeline
  belongs_to :carousel, optional: true
  acts_as_list scope: :timeline
end
