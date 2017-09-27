require 'wp_api'

class HomeController < ApplicationController
  def index;
	@base_media_uri = "http://suresite.wpengine.com/wp-content/uploads/"

    @api_call = HomePageQueries.new()
    @posts = @api_call.posts
    @posts.each_with_index do |p, index|
      p['featured_image'] = p['_embedded']['wp:featuredmedia'][0]['media_details']
    end

    @howtos = @api_call.howtos
    
  end
end
