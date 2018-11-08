class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts = @api_call.main_query
    @howdois = @api_call.howdois
    @popular_posts = @api_call.popular_posts
  end
end
