require 'selenium/webdriver'
require 'capybara-screenshot/rspec'

# Capybara::Screenshot.register_driver(:headless_chrome) do |driver, path|
#   driver.browser.save_screenshot(path)
# end
#
# Capybara.javascript_driver = :headless_chrome
#
# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
#
# Capybara.register_driver :headless_chrome do |app|
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: {
#       args: %w[headless enable-features=NetworkService,NetworkServiceInProcess]
#     }
#   )
#
#   Capybara::Selenium::Driver.new app,
#     browser: :chrome,
#     desired_capabilities: capabilities
# end
#
# Capybara.default_driver = :headless_chrome
 # no driver called :chrome was found, available drivers: :rack_test, :selenium, :selenium_headless, :selenium_chrome, :selenium_chrome_headless
Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome_headless

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium_chrome_headless
end
