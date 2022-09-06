class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  def self.average_rating(trip)
    Review.where(trip_id: trip.id).average(:rating).to_i
  end

end
