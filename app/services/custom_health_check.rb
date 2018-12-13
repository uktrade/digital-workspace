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
    response = Typhoeus.get(
      "#{URI.join(ENV['PEOPLEFINDER_URL'], '/api/people')}?email=something-random",
      headers: {
        'Authorization' => "Token token=#{ENV['PEOPLEFINDER_AUTH_TOKEN']}"
      }
    )
    return if JSON.parse(response.body)['error'] =~ /person was not found/

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
