require 'httparty'

class HomePageQueries
  def popular_posts
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/popular_pages?orderby=menu_order&order=asc&per_page=3&_embed')
    JSON.parse(response.body)
  end

  def posts
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news?orderby=date&order=desc&per_page=8&_embed')
    JSON.parse(response.body)
  end

  def howtos
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/how_tos?orderby=date&order=desc&per_page=20')
    JSON.parse(response.body)
  end
end
