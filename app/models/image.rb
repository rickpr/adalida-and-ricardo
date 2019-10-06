class Image < ApplicationRecord
  belongs_to :container, polymorphic: true
  has_one_attached :image
end
