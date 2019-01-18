class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts = @api_call.main_query
    @howdois = @api_call.howdois
    @popular_posts = @api_call.popular_posts

    # TODO: This is awful but added like this to keep it consistent with other
    #   controllers for now. Needs refactoring.
    @global_notification = @posts.first if @posts.first.is_a?(Hash)
  end
end
