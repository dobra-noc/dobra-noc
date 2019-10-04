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

    location = Location.find_or_create_by_address_and_by_description_and_by_longitude_and_by_latitude(
      address: ENV["ADDRESS"] || "Nieznany",
      description: ENV["DESCRIPTION"] || "Nieznany adres",
      longitude: ENV["LONGITUDE"] || "",
      latitude: ENV["LATITUDE"] || "",
      )

    if sound_levels.empty?
      Rails.logger.error("Sonometer log levels for #{duration} (#{start_at} .. #{end_at}) are empty!")
    else
      laeq = calculator.laeq(sound_levels)
      EquivalentContinuousSoundLevel.create!(laeq: laeq, start_at: start_at, end_at: end_at, duration: duration, location_id: location.id)
    end
  end
end
