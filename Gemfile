source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'

gem 'sendgrid-ruby'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'devise_invitable'
gem 'duktape'
# gem 'mailcatcher', '~> 0.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'dotenv-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'rails-ujs'
gem 'popper_js'
gem 'tether-rails'
gem 'simple_form'
gem 'execjs'
gem 'bootsnap', '~> 1.1', '>= 1.1.7'
gem 'coffee-script-source', '1.8.0'
# Reduces boot times through caching; required in config/boot.rb

gem 'simplecov', require: false, group: :test

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'factory_bot'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'selenium-webdriver', '~> 2.53', '>= 2.53.4'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '1.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
