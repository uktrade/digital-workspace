class WpApi
  require 'httparty'
  BASE_URI = ENV['WP_API_URL']

  class << self
    def get_json_body(path)
      JSON.parse(get_json(path).body)
    end

    def get_json_headers(path)
      JSON.parse(get_json(path).headers)
    end

    def get_json(path)
      HTTParty.get(URI.join(BASE_URI, path).to_s)
    end
  end
end
