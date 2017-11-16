HealthCheck.setup do |config|
  config.uri = 'health_check'
  config.success = 'success'
  config.http_status_for_error_text = 500
  config.http_status_for_error_object = 500
  config.standard_checks = %w[custom redis]

  config.add_custom_check do
    # any code that returns blank on success and non blank string upon failure
    CustomHealthCheck.perform_check
  end

  config.redis_url = ENV['REDIS_URL']
end
