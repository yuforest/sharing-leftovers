class Leftover < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
