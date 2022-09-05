class Stop < ApplicationRecord
  belongs_to :trip, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :address, :description, presence: true
end
