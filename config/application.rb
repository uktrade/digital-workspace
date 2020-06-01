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
    config.redis_cache_url = ENV['REDIS_URL'] # Overridden in production config

    def self.rsa_key_from_base64_encoded_pem(value)
      return nil if value.blank?

      pem = Base64.decode64(value)
      OpenSSL::PKey::RSA.new(pem)
    end

    config.people_finder_api_private_key = rsa_key_from_base64_encoded_pem(
      ENV['PEOPLE_FINDER_API_PRIVATE_KEY']
    )
  end
end
