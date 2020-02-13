# frozen_string_literal: true

ruby '2.6.5'

source 'https://rubygems.org'

gem 'rails', '~> 6.0.0'

gem 'haml-rails', '~> 2.0'
gem 'jbuilder', '~> 2.5'
gem 'json'
gem 'omniauth-oauth2'
gem 'puma', '~> 4.2'
gem 'readthis'
gem 'redis'
gem 'sass-rails', '~> 6.0'
gem 'twitter'
gem 'typhoeus'
gem 'uglifier', '>= 1.3.0'
gem 'zendesk_api'

gem 'govuk_elements_rails'
gem 'govuk_template'

gem 'foreman'
gem 'health_check'
gem 'sentry-raven'

gem 'rails_semantic_logger'

# TODO: Figure out why sprockets upgrade to 4.x breaks SCSS variables
#       Until then, keep it pinned at 3.x.
#       c.f. https://github.com/rails/sprockets/issues/474
gem 'sprockets', '~> 3.7'

group :development, :test do
  gem 'awesome_print'
  gem 'bundler-audit'
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop', '~> 0.76.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'vcr'
  gem 'webmock'
end
