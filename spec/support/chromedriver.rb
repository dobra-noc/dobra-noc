require 'selenium/webdriver'
require 'capybara-screenshot/rspec'

Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome_headless

Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.default_driver        = :selenium_chrome_headless
end
