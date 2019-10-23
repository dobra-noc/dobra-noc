# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 6.0.0'
gem 'rails-settings-cached', '~> 2.0'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'faker'
gem 'fast_jsonapi', '>= 1.5'
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'foreman'
gem 'gm3156', '>= 0.0.3'
gem 'rufus-scheduler'
gem 'webpacker'

group :development, :test, :raspbian do
  gem 'pry-byebug', '>= 3.7.0'
end

group :raspbian do
  gem 'rpi_gpio'
end

group :development, :raspbian do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', '>= 0.22.0'
  gem 'pronto-rubocop', '>= 0.10.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
  gem 'rspec'
  gem 'rspec-rails', '~> 3.8'
  gem 'selenium-webdriver'
end
