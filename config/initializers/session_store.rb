if Rails.env.production?
  DigitalWorkspace::Application.config.session_store :redis_store
end
