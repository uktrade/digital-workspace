require 'wp_api'
require 'peoplefinder_api'
require 'twitter'

class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts_antonia = @api_call.posts_antonia
    @posts_departmental = @api_call.posts_departmental
    @posts_ministers = @api_call.posts_ministers
    @howtos = @api_call.howtos
    @popular_posts = @api_call.popular_posts
    @people_finder = PeopleFinder.new
    @people_finder_profile = @people_finder.profile
  end
end
