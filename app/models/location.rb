# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :equivalent_continuous_sound_levels

  validates :latitude, uniqueness: { scope: %i[latitude longitude] }
end
