# frozen_string_literal: true

Rails.application.configure do
  config.action_controller.perform_caching = true
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.js_compressor = :uglifier
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.force_ssl = true
  config.i18n.fallbacks = true
  config.read_encrypted_secrets = true

  # Serve static assets even in production
  config.serve_static_assets = true
  config.public_file_server.enabled = true

  # Logging
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.log_level = :info
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  # See ApplicationController#append_info_to_payload
  config.lograge.custom_options = ->(event) { event.payload }
end
