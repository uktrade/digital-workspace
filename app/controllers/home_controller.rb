class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts = @api_call.main_query
    @comments_headers = @api_call.main_comments_headers
    @howtos = @api_call.howtos
    @popular_posts = @api_call.popular_posts
    @people_finder_profile = PeopleFinderProfile.from_api(current_user)
  end
end
