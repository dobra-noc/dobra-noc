class SonometerListenerJob < ApplicationJob
  queue_as :default

  def perform
    device = GM3156::Device.new(filter: :a, speed: :slow, max_mode: false, range: 0)

    device.read do |record|
      SonometerRecord.create!(
        spl: record.spl,
        filter: record.settings.filter.to_s.upcase,
        max_mode: record.settings.max_mode,
        measured_at: record.timestamp
      )
    end

    device.close
  end
end
