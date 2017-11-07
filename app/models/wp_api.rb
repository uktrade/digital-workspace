class WpApi
  require 'httparty'
  BASE_URI = ENV['WP_API_URL']
  BASE_CUSTOM_URI = ENV['WP_API_CUSTOM']
  AUTH_TOKEN = ENV['WP_API_KEY']

  class << self
    def get_json_body(path)
      Rails.cache.fetch("#{path}_body", expires: 1.minute) do
        JSON.parse(get_json(path).body)
      end
    end

    def get_headers(path)
      Rails.cache.fetch("#{path}_headers", expires: 1.minute) do
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

    def get_search_json_body(params)
      path = 'search?s=' + params[:s]
      path = search_filter_types(params, path)
      path = search_filter_news(params, path)
      path = search_filter_themes(params, path)
      HTTParty.get(
        URI.join(BASE_CUSTOM_URI, path).to_s,
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        }
      )
    end

    def search_filter_types(params, path)
      path + '&type=' + params[:filter_types] if params[:filter_types]
    end

    def search_filter_news(params, path)
      path + '&news_category=' + params[:filter_news] if params[:filter_news]
    end

    def search_filter_themes(params, path)
      path + '&theme_taxonomy=' + params[:filter_themes] if params[:filter_themes]
    end

    def get_search_json_headers(params)
      get_search_json_body(params).headers
    end
  end
end
