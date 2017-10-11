ruby '2.4.1'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'twitter'

gem 'govuk_elements_rails'
gem 'govuk_template'
gem 'httparty'
gem 'omniauth-oauth2'

group :development, :test do
  gem 'bundler-audit'
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'rubocop', '~> 0.50.0', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'vcr'
  gem 'webmock'
end
