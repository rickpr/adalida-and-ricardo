class RemoveImageAltTextFromTimelinePost < ActiveRecord::Migration[6.0]
  def change
    remove_column :timeline_posts, :image_alt_text, :text
  end
end
