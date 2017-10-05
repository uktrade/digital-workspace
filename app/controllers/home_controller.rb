require 'wp_api'
require 'twitter'

class HomeController < ApplicationController
  def index
    @base_media_uri = 'https://uat-dit.useconnect.co.uk/wp-content/uploads/'

    @api_call = HomePageQueries.new
    @posts_antonia = @api_call.posts_antonia
    @posts_departmental = @api_call.posts_departmental
    @posts_ministers = @api_call.posts_ministers
    @howtos = @api_call.howtos
    @popular_posts = @api_call.popular_posts
  end
end
