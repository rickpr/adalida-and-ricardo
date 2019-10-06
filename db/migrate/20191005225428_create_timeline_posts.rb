class CreateTimelinePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :timeline_posts do |t|
      t.references :timeline, null: false, foreign_key: true
      t.text :title
      t.text :description
      t.text :body
      t.date :date
      t.text :image_alt_text

      t.timestamps
    end
  end
end
