class Trip < ApplicationRecord
  belongs_to :user
  has_many :stops
  has_many :ratings
  has_many :favorites
end
