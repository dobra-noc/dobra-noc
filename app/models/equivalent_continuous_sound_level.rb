class EquivalentContinuousSoundLevel < ApplicationRecord
  belongs_to :location
  enum duration: [:hour]

  validates :start_at, presence: true, uniqueness: { scope: [:end_at, :duration] }
  validates :end_at, :location_id, presence: true
  validates :laeq, presence: true, numericality: { greater_than: 0 }
  validates :duration, presence: true

  scope :between_timestamps, -> (min, max) { where(start_at: (min..max), end_at: (min..max) ) }
end
