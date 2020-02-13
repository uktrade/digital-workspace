# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DigitalWorkspace
  class Application < Rails::Application
    config.load_defaults 6.0

    config.middleware.insert_after Rails::Rack::Logger, HealthCheck::MiddlewareHealthcheck

    config.gtm_id = ENV['GTM_ID']
    config.gtm_extra = ENV['GTM_EXTRA']
    config.redis_cache_url = ENV['REDIS_URL']

    # Caching and sessions
    config.cache_store = :redis_cache_store, { url: config.redis_cache_url }
    config.session_store :cache_store,
                         key: 'workspace_session',
                         expire_after: 1.hour,
                         httponly: true
  end
end
