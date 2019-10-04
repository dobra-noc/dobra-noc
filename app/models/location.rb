class Location < ApplicationRecord
  has_many :equivalent_continuous_sound_levels

  validates uniqueness: { scope: [:latitude, :longitude] }
end
