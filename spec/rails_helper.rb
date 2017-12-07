require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

require 'webmock/rspec'
require 'vcr'
VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.before_record do |i|
    i.request.uri = i.request.uri.gsub(/email=.*gov.uk/, 'email=<removed>')
    i.response.body = '[]' if i.response.body =~ /^\[{\"id\":/
    i.response.body = '{}' if i.response.body =~ /^\{\"token_type\":\"bearer\"/
    i.response.headers['Link'] = ['http://test.local'] if i.response.headers['Link']
  end
  config.filter_sensitive_data('<PEOPLEFINDER_URL>') { ENV['PEOPLEFINDER_URL'] }
  config.filter_sensitive_data('<PEOPLEFINDER_AUTH_TOKEN>') { ENV['PEOPLEFINDER_AUTH_TOKEN'] }
  config.filter_sensitive_data('<TWITTER_KEY>') { ENV['TWITTER_KEY'] }
  config.filter_sensitive_data('<TWITTER_SECRET>') { ENV['TWITTER_SECRET'] }
  config.filter_sensitive_data('<WP_API_URL>') { ENV['WP_API_URL'] }
  config.filter_sensitive_data('<WP_API_KEY>') { ENV['WP_API_KEY'] }
end

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }
