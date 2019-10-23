# frozen_string_literal: true

Thread.new do
  SonometerListenerJob.perform_now if Setting.is_recording
end
