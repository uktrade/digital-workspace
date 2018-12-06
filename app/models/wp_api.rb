class WpApi
  BASE_URI = ENV['WP_API_URL']
  BASE_CUSTOM_URI = ENV['WP_API_CUSTOM']
  AUTH_TOKEN = ENV['WP_API_KEY']

  # Allow disabling SSL host verification in development environments
  SSL_VERIFYHOST = ENV['SSL_VERIFYHOST'].present? ? 0 : 2

  class << self
    def get_json_body(base_path, params: {}, use_cache: true)
      path = base_path + '?' + params.to_query

      if use_cache
        Rails.cache.fetch("#{path}_body", expires_in: 60) do
          JSON.parse(get_json(path).body)
        end
      else
        JSON.parse(get_json(path).body)
      end
    end

    def get_custom_json_body(path, use_cache = true)
      if use_cache
        Rails.cache.fetch("#{path}_body", expires_in: 60) do
          JSON.parse(get_custom_json(path).body)
        end
      else
        JSON.parse(get_custom_json(path).body)
      end
    end

    def get_headers(path, use_cache = true)
      if use_cache
        Rails.cache.fetch("#{path}_headers", expires_in: 60) do
          get_json(path).headers
        end
      else
        get_json(path).headers
      end
    end

    def get_json(path)
      Typhoeus.get(
        URI.join(BASE_URI, path).to_s,
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        },
        ssl_verifyhost: SSL_VERIFYHOST
      )
    end

    def get_custom_json(path)
      Typhoeus.get(
        URI.join(BASE_CUSTOM_URI, path).to_s,
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        },
        ssl_verifyhost: SSL_VERIFYHOST
      )
    end

    def post_comment_json(json)
      Typhoeus.post(
        URI.join(BASE_URI, 'comments').to_s,
        body: json,
        headers: { 'Authorization' => "Basic #{AUTH_TOKEN}" },
        ssl_verifyhost: SSL_VERIFYHOST
      )
    end

    def get_search_json_body(params)
      filters = {
        s: params[:s],
        type: params[:filter_types],
        news_category: params[:filter_news],
        topic: params[:filter_topics],
        page: params[:page]
      }

      search_json_request('search', params: filters.compact)
    end

    def search_json_request(base_path, params: {})
      path = base_path + '?' + params.to_query

      Typhoeus.get(
        URI.join(BASE_CUSTOM_URI, path).to_s,
        headers: {
          'Authorization' => "Basic #{AUTH_TOKEN}"
        },
        ssl_verifyhost: SSL_VERIFYHOST
      )
    end

    def get_search_json_headers(params)
      get_search_json_body(params).headers
    end
  end
end
