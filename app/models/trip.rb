class Trip < ApplicationRecord

  # include PgSearch::Model
  # pg_search_scope :search_by_name_description,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true }
  # }

  belongs_to :user
  belongs_to :original_trip, class_name: "Trip", optional: true
  has_many :stops, dependent: :destroy
  accepts_nested_attributes_for :stops, allow_destroy: true, reject_if: :all_blank
  attr_accessor :original_image_url

  validates :name, :main_image, :description, :amount_of_travellers, :amount_of_children, :categories, presence: true

  has_many :ratings
  has_many :favorites
  has_many :reviews, dependent: :destroy
  has_one_attached :main_image
  has_many_attached :gallery_images
  acts_as_favoritable

  def self.copied_trips(trip)
    Trip.where(original_trip_id: trip.id).count
  end
end
