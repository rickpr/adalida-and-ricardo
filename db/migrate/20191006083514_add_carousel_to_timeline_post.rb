class AddCarouselToTimelinePost < ActiveRecord::Migration[6.0]
  class TimelinePost < ActiveRecord::Base
    belongs_to :carousel
  end
  class Carousel < ActiveRecord::Base; end
  def change
    reversible do |direction|
      direction.up do
        add_reference :timeline_posts, :carousel, null: true, foreign_key: true
        add_carousels_to_existing_timeline_posts!
        change_column :timeline_posts, :carousel_id, :integer, null: false
      end

      direction.down do
        remove_column :timeline_posts, :carousel_id
      end
    end
  end

  private
  
  def add_carousels_to_existing_timeline_posts!
    TimelinePost.all.each { |timeline_post| timeline_post.update!(carousel: Carousel.create!) }
  end
end
