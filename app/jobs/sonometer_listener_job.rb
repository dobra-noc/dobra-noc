class SonometerListenerJob < ApplicationJob
  queue_as :default

  def perform
    led = Led.new(13,11,7)
    device = GM3156::Device.new(filter: :a, speed: :slow, max_mode: false, range: 0)

    device.read do |record|
      sonometr_record = SonometerRecord.new(
        spl: record.spl,
        filter: record.settings.filter.to_s.upcase,
        max_mode: record.settings.max_mode,
        measured_at: record.timestamp
      )
      led.working if  sonometr_record.save!
    end

    device.close
    led.turn_off_pins
  end
end
