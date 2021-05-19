# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.6.5"

# Rails
gem "bootsnap", "~> 1.4.7", require: false
gem "devise", "~> 4.7.2"
gem "jbuilder", "~> 2.10"
gem "pg", "~> 1.2.3"
gem "puma", "~> 4.3.8"
gem "pundit", "~> 2.1"
gem "rails", "~> 6.0.3.2"
gem "redis", "~> 4.2.1"

# Forms
gem "select2_simple_form", github: "lndl/select2_simple_form", tag: "0.7.3"
gem "simple_form", "~> 5.0.2"

# Background jobs
gem "sidekiq", "~> 6.1.1"
gem "sidekiq-failures", "~> 1.0"

# Model validation
gem "date_validator", "~> 0.10.0"

# Bootstrap and CSS
gem "autoprefixer-rails", "~> 9.8.5"
gem "bootstrap-sass", "~> 3.4.1"
gem "font-awesome-sass", "~> 5.13"
gem "sassc-rails", "~> 2.1.2"

# Javascript
gem "uglifier", "~> 4.2"
gem "webpacker", "~> 5.1.1"

# Image storage
gem "carrierwave", "~> 2.1"
gem "cloudinary", "~> 1.16.1"

# API
gem "nokogiri", "~> 1.11.0.rc2"

# Weather
gem "lunartic", "~> 0.2.1"

# CSV
gem "csv", "~> 3.1.6"

# Geocoding
gem "geocoder", "~> 1.6.3", ">= 1.6.3"

# Mailing
gem "postmark-rails", "~> 0.20.0"

group :development do
  gem "awesome_print", "~> 2.0.0.pre2"
  gem "letter_opener", "~> 1.7"
  gem "pry-byebug", "~> 3.9"
  gem "pry-rails", "~> 0.3.9"
  gem "rubocop", "~> 0.88.0", require: false
  gem "rubocop-performance", "~> 1.7.1", require: false
  gem "rubocop-rspec", "~> 1.42", require: false
  gem "web-console", "~> 4.0.4"
end

group :development, :test do
  gem "rspec-rails", "~> 4.0.1"

  # Loggers
  gem "listen", "~> 3.2.1"
  gem "sentry-raven", "~> 3.0"

  # Web testing
  gem "capybara", "~> 3.33"
  gem "launchy", "~> 2.5"
  gem "selenium-webdriver", "~> 4.0.0.alpha6"
  gem "webdrivers", "~> 4.4.1"

  # Environment variable
  gem "dotenv-rails"

  # Preload application for bash console
  gem "spring", "~> 2.1"
  gem "spring-watcher-listen", "~> 2.0.1"
end
