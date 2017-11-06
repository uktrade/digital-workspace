if ENV['REDIS_URL'].present? && !Rails.env.test?
  redis_session_store_url =
    {
      key: 'your_session_key',
      redis: {
        expire_after: 120.minutes,
        key_prefix: 'workspace:session:',
        url: URI.join(ENV.fetch('REDIS_URL'), '/o/session').to_s
      }
    }

  DigitalWorkspace::Application
    .config.session_store :redis_session_store, redis_session_store_url
end
