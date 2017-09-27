require 'httparty'

class HomePageQueries
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
