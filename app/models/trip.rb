class Trip < ApplicationRecord

  # include PgSearch::Model
  # pg_search_scope :search_by_name_description,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true }
  # }

  belongs_to :user
  has_many :stops, dependent: :destroy
  accepts_nested_attributes_for :stops, allow_destroy: true
  attr_accessor :original_image_url

  validates :name, :main_image, :description, :amount_of_travellers, :amount_of_children, :categories, presence: true
  # validates :name, length: { in: 6..250 }, uniqueness: true

  has_many :ratings
  has_many :favorites
  has_one_attached :main_image
  has_many_attached :gallery_images
  acts_as_favoritable


end
