class Trip < ApplicationRecord
  belongs_to :user
  has_many :stops, dependent: :destroy
  accepts_nested_attributes_for :stops, allow_destroy: true

  has_many :ratings
  has_many :favorites
  has_one_attached :main_image
  has_many_attached :gallery_images
  acts_as_favoritable
end
