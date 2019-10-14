class MakeCarouselNullOnTimelinePost < ActiveRecord::Migration[6.0]
  def change
    change_column_null :timeline_posts, :carousel_id, true
  end
end
