# frozen_string_literal: true

class SonometerListenerJob < ApplicationJob
  queue_as :default

  def perform
    is_raspberry = Raspberry.is_raspberry?
    led = Raspberry::Led.new(13, 11, 7) if is_raspberry
    device = GM3156::Device.new(filter: :a, speed: :slow, max_mode: false, range: 0)

    device.read do |record|
      sonometr_record = SonometerRecord.new(
        spl: record.spl,
        filter: record.settings.filter.to_s.upcase,
        max_mode: record.settings.max_mode,
        measured_at: record.timestamp
      )
      if is_raspberry
        led.working if sonometr_record.save!
      else
        sonometr_record.save!
    end

    device.close
    led.turn_off_pins if is_raspberry
  end
end
