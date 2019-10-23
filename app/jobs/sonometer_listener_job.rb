# frozen_string_literal: true

class SonometerListenerJob < ApplicationJob
  queue_as :default

  def perform
    led = Led.new(13, 11, 7) if Rails.env.raspbian?
    device = GM3156::Device.new(filter: :a, speed: :slow, max_mode: false, range: 0)

    device.read do |record|
      sonometr_record = SonometerRecord.new(
        spl: record.spl,
        filter: record.settings.filter.to_s.upcase,
        max_mode: record.settings.max_mode,
        measured_at: record.timestamp
      )
      if (sonometr_record.save! if Setting.is_recording)
        (Rails.env.raspbian? ? led.working : true)
      end
    end

    device.close
    led.turn_off_pins
  end
end
