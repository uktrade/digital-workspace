class WpApi
  require 'httparty'
  BASE_URI = ENV['WP_API_URL']
  AUTH_TOKEN = ENV['WP_API_KEY']

  class << self
    def get_json_body(path, use_cache = true)
      if use_cache
        Rails.cache.fetch("#{path}_body", expires: 1.minute) do
          JSON.parse(get_json(path).body)
        end
      else
        JSON.parse(get_json(path).body)
      end
    end

    def get_headers(path, use_cache = true)
      if use_cache
        Rails.cache.fetch("#{path}_headers", expires: 1.minute) do
          get_json(path).headers
        end
      else
        get_json(path).headers
      end
    end

    def get_json(path)
      HTTParty.get(
        URI.join(BASE_URI, path).to_s,
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        }
      )
    end

    def post_comment_json(json)
      HTTParty.post(
        URI.join(BASE_URI, 'comments').to_s,
        body: json,
        headers: { 'Authorization' => "Basic #{AUTH_TOKEN}" }
      )
    end
  end
end
