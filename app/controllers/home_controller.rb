class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts = @api_call.main_query
    @comments_headers = @api_call.main_comments_headers
    @howdois = @api_call.howdois
    @popular_posts = @api_call.popular_posts
  end
end
