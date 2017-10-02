require 'httparty'

class HomePageQueries
  def popular_posts
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/popular_pages?orderby=menu_order&order=asc&per_page=3&_embed')
    JSON.parse(response.body)
  end

  def posts_ministers
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news?orderby=date&order=desc&per_page=2&filter[news_category]=ministers&_embed')
    JSON.parse(response.body)
  end

  def posts_antonia
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news?orderby=date&order=desc&per_page=2&filter[news_category]=antonia&_embed')
    JSON.parse(response.body)
  end

  def posts_departmental
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news?orderby=date&order=desc&per_page=2&filter[news_category]=departmental&_embed')
    JSON.parse(response.body)
  end

  def howtos
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/how_tos?orderby=date&order=desc&per_page=20')
    JSON.parse(response.body)
  end
end

class SingleQueries
  def main_query
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/how_tos?slug=how-to-catch-a-bus')
    JSON.parse(response.body)
  end
end
