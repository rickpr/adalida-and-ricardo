class TimelinePost < ApplicationRecord
  belongs_to :timeline
  belongs_to :carousel, optional: true
end
