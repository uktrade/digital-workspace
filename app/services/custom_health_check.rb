class CustomHealthCheck
  require 'httparty'

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
    response = HTTParty.get(
      "#{URI.join(ENV['PEOPLEFINDER_URL'], '/api/people')}?email=something-random",
      headers: {
        'Authorization' => "Token token=#{ENV['PEOPLEFINDER_AUTH_TOKEN']}"
      }
    )
    return if [404, 200].include?(response.code)

    @errors << 'Unable to connect to the People Finder API'
  end

  def check_wordpress_api
    response = HTTParty.get(
      URI.join(ENV['WP_API_URL'], '/news').to_s,
      headers: {
        'Authorization' => "Basic #{ENV['WP_API_KEY']}"
      }
    )
    return if response.code == 200

    @errors << 'Unable to connect to the Word Press API'
  end
end