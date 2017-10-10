require 'httparty'

class HomePageQueries
  def popular_posts
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/popular_pages?orderby=menu_order&order=asc&per_page=3&_embed')
    JSON.parse(response.body)
  end

  def posts_ministers
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=ministers&_embed')
    JSON.parse(response.body)
  end

  def posts_antonia
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=antonia&_embed')
    JSON.parse(response.body)
  end

  def posts_departmental
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=departmental&_embed')
    JSON.parse(response.body)
  end

  def howtos
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=howto&orderby=date&order=desc&per_page=20')
    JSON.parse(response.body)
  end
end

class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?slug=' + @slug)
    JSON.parse(response.body)
  end
end

class NewsQueries
  def main_query
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=news&_embed')
    JSON.parse(response.body)
  end

  def news_category
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news_category')
    JSON.parse(response.body)
  end
end

class NewsTypeQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/pages?type=news&_embed&filter[news_category]=' + @slug) # rubocop:disable Metrics/LineLength
    JSON.parse(response.body)
  end
end
