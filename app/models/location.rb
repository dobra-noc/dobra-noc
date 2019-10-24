# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :equivalent_continuous_sound_levels, dependent: :destroy

  validates :latitude, uniqueness: { scope: :longitude }
end
