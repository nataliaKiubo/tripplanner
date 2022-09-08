class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :content, length: { maximum: 100,
  too_long: "%{count} characters is the maximum allowed" }

  def self.average_rating(trip)
    Review.where(trip_id: trip.id).average(:rating).to_f
  end

end
