class Trip < ApplicationRecord
  belongs_to :user
  has_many :stops
  accepts_nested_attributes_for :stops, :allow_destroy => true
  attr_accessor :original_image_url

  has_many :ratings
  has_many :favorites
  has_one_attached :main_image
  has_many_attached :gallery_images
end
