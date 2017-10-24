class WpApi
  require 'httparty'
  BASE_URI = ENV['WP_API_URL']
  AUTH_TOKEN = ENV['WP_API_KEY']

  class << self
    def get_json_body(path)
      JSON.parse(get_json(path).body)
    end

    def get_headers(path)
      get_json(path).headers
    end

    def get_json(path)
      HTTParty.get(
        "#{URI.join(BASE_URI, path).to_s}",
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        }
      )
    end

  end
end
