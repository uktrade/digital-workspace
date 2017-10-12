class WpApi
  require 'httparty'
  BASE_URI = ENV['WP_API_URL']

  class << self
    def get_json_body(path)
      uri = URI.join(BASE_URI, path).to_s
      response = HTTParty.get(uri)
      JSON.parse(response.body)
    end
  end
end

class HomePageQueries
  def popular_posts
    WpApi.get_json_body(
      'popular_pages?orderby=menu_order&order=asc&per_page=3&_embed'
    )
  end

  def posts_ministers
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=ministers&_embed'
    )
  end

  def posts_antonia
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=antonia&_embed'
    )
  end

  def posts_departmental
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=departmental&_embed'
    )
  end

  def howtos
    WpApi.get_json_body('pages?type=howto&orderby=date&order=desc&per_page=20')
  end
end

class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("pages?slug=#{@slug}")
  end
end

class NewsQueries
  def main_query
    WpApi.get_json_body('pages?type=news&_embed')
  end

  def other_categories_query
    WpApi.get_json_body('news_category')
  end
end

class NewsTypeQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("pages?type=news&_embed&filter[news_category]=#{@slug}")
  end

  def other_categories_query
    WpApi.get_json_body('news_category')
  end
end
