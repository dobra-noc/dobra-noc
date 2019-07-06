require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.cron '0 * * * *' do
  CalculateEquivalentContinuousSoundLevelJob.new.perform
end
