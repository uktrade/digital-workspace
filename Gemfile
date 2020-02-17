# frozen_string_literal: true

ruby '2.6.5'

source 'https://rubygems.org'

gem 'rails', '~> 6.0.0'

gem 'haml-rails', '~> 2.0'
gem 'omniauth-oauth2'
gem 'puma', '~> 4.2'
gem 'redis'
gem 'sass-rails', '~> 6.0'
gem 'twitter'
gem 'typhoeus'
gem 'uglifier', '>= 1.3.0'
gem 'zendesk_api'

gem 'govuk_elements_rails'
gem 'govuk_template'

gem 'health_check'
gem 'lograge'
gem 'sentry-raven'

# TODO: Figure out why sprockets upgrade to 4.x breaks SCSS variables
#       Until then, keep it pinned at 3.x.
#       c.f. https://github.com/rails/sprockets/issues/474
gem 'sprockets', '~> 3.7'

group :development, :test do
  gem 'bundler-audit'
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop', '~> 0.76.0', require: false
end

group :test do
  gem 'selenium-webdriver'
  gem 'vcr'
  gem 'webmock'
end
