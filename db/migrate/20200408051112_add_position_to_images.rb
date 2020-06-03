class AddPositionToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :position, :integer
    Carousel.all.each do |carousel|
      carousel.images.order(:id).each_with_index do |image, index|
        image.update_column(:position, index)
      end
    end
  end
end
