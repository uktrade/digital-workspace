# frozen_string_literal: true

class CustomHealthCheck
  def self.perform_check
    health_check = CustomHealthCheck.new
    health_check.response
  end

  def initialize
    @errors = []
    check_peoplefinder_api
    check_wordpress_api
  end

  def response
    @errors.empty? ? '' : @errors.join('. ')
  end

  private

  def check_peoplefinder_api
    request_path = '/api/v2/people_profiles/does-not-exist'
    jwt = JWT.encode(
      { fullpath: request_path, exp: 1.minute.from_now.to_i },
      Rails.configuration.people_finder_api_private_key,
      'RS512'
    )
    response = Typhoeus.get(
      URI.join(ENV['PEOPLEFINDER_API_URL'], request_path),
      headers: {
        'Authorization' => "Bearer #{jwt}"
      }
    )
    return if response.code == 404

    @errors << 'Unable to connect to the People Finder API'
  end

  def check_wordpress_api
    response = Typhoeus.get(
      ENV['WP_API_URL'],
      headers: {
        'Authorization' => "Basic #{ENV['WP_API_KEY']}"
      }
    )
    return if response.code == 200

    @errors << 'Unable to connect to the Word Press API'
  end
end
