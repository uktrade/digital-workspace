class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts = @api_call.main_query
    @comments_headers = @api_call.main_comments_headers
    @howdois = @api_call.howdois
    @popular_posts = @api_call.popular_posts
    @visualisations = @api_call.visualisations

    @global_notifications = @api_call.main_query
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end
end
