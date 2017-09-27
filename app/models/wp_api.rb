require 'httparty'

class HomePageQueries
  
  POPULAR_POSTS_URI = 'https://uat-dit.useconnect.co.uk/wp-json/wp/v2/popular_pages?orderby=menu_order&order=asc&per_page=3&_embed'
  def popular_posts
    response = HTTParty.get(POPULAR_POSTS_URI)
    json = JSON.parse(response.body)
  end

  POSTS_URI = 'https://uat-dit.useconnect.co.uk/wp-json/wp/v2/news?orderby=date&order=desc&per_page=8&_embed'
  def posts
  	response = HTTParty.get(POSTS_URI)
  	json = JSON.parse(response.body)
  end

  HOWTOS_URI = 'https://uat-dit.useconnect.co.uk/wp-json/wp/v2/how_tos?orderby=date&order=desc&per_page=20'
  def howtos
  	response = HTTParty.get(HOWTOS_URI)
  	json = JSON.parse(response.body)
  end
end
