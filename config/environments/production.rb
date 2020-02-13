# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Make logs meet the DIT Cross Application Access Logs format
  config.log_tags = {
    request_id: :request_id,
    sso_user_id: lambda { |request|
      # At the point in the request where logging commences, Rails hasn't yet
      # populated `request.session`, so we need to access it through the cookie jar.
      session_key = Rails.application.config.session_options[:key]
      request.cookie_jar.encrypted[session_key].try(:[], 'ditsso_user_id')
    }
  }
  config.rails_semantic_logger.format = :json

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    STDOUT.sync = true
    config.rails_semantic_logger.add_file_appender = false
    config.semantic_logger.add_appender(
      io: STDOUT,
      level: config.log_level,
      formatter: config.rails_semantic_logger.format
    )
  end

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify
end
