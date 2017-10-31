if ENV['REDIS_SESSION_URL'].present?
  DigitalWorkspace::Application.config.session_store :redis_store,
    servers: [ENV['REDIS_SESSION_URL']]
end
