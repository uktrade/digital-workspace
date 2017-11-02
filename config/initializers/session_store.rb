if ENV['REDIS_SESSION_URL'].present? && !Rails.env.test?
  DigitalWorkspace::Application.config.session_store :redis_session_store, {
    key: 'your_session_key',
    redis: {
      expire_after: 120.minutes,
      key_prefix: 'workspace:session:',
      url: ENV['REDIS_SESSION_URL'],
    }
  }
end
