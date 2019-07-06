class SonometerRecord < ApplicationRecord

  validates :measured_at, uniqueness: true, presence: true
  validates :spl, presence: true, numericality: { greater_than: 0 }
  validates :filter, presence: true, inclusion: { in: ['A', 'B'] }
  # validates :max_mode, presence: true

end
