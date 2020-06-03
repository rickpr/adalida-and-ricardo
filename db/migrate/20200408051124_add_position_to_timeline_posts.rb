class AddPositionToTimelinePosts < ActiveRecord::Migration[6.0]
  def change
    add_column :timeline_posts, :position, :integer
    Timeline.all.each do |timeline|
      timeline.timeline_posts.order(:id).each.with_index(1) do |timeline_post, index|
        timeline_post.update_column(:position, index)
      end
    end
  end
end
