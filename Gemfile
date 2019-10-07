source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'fast_jsonapi', '>= 1.5'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
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

gem 'gm3156', '>= 0.0.3'
gem 'webpacker'
gem 'foreman'
gem 'rufus-scheduler'
gem 'foreman'

group :development, :test do
  gem 'pry-byebug', '>= 3.7.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pronto-rubocop', '>= 0.10.0'
  gem 'overcommit', '>= 0.22.0'
end

group :test do
  gem 'rspec'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
