# frozen_string_literal: true

require_relative '../../lib/gios/indicators/equivalent_continuous_sound_level'

class EquivalentContinuousSoundLevelCalculator
  def perform(start_at, end_at, duration)
    Rails.logger.info("Calculating equivalent continuous sound level for #{duration} (#{start_at} .. #{end_at}).")

    calculator = GIOS::Indicators::EquivalentContinuousSoundLevel.new

    sound_levels = SonometerRecord.where(
      filter: 'A',
      max_mode: false,
      measured_at: start_at..end_at
    ).pluck(:spl)

    location = Location.find_or_create_by(
      address: Setting.address,
      description: Setting.description,
      longitude: Setting.longitude,
      latitude: Setting.latitude
    )

    if sound_levels.empty?
      Rails.logger.error("Sonometer log levels for #{duration} (#{start_at} .. #{end_at}) are empty!")
    else
      laeq = calculator.laeq(sound_levels)
      EquivalentContinuousSoundLevel.create!(laeq: laeq, start_at: start_at, end_at: end_at, duration: duration, location_id: location.id)
    end
  end
end
