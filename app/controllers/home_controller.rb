require 'wp_api'

class HomeController < ApplicationController
  def index
    @base_media_uri = 'https://uat-dit.useconnect.co.uk/wp-content/uploads/'

    @api_call = HomePageQueries.new
    @posts = @api_call.posts
    @posts.each_with_index do |p, index|
      # p['featured_image'] = p['_embedded']['wp:featuredmedia'][0]['media_details']
    end
    @howtos = @api_call.howtos
    @popular_posts = @api_call.popular_posts
  end
end
