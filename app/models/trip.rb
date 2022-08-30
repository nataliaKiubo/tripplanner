class Trip < ApplicationRecord
  belongs_to :user
  has_many :stops
  has_many :ratings
  has_many :favorites
  has_one_attached :main_image
  has_many_attached :gallery_images
end
