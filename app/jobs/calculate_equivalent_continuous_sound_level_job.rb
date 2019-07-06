class CalculateEquivalentContinuousSoundLevelJob < ApplicationJob
  queue_as :default

  def perform
    start_at = 1.hour.ago.beginning_of_hour
    end_at = 1.hour.ago.end_of_hour

    EquivalentContinuousSoundLevelCalculator.new.perform(start_at, end_at, :hour)
  end
end
