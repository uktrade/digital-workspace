class HomeController < ApplicationController
  def index
    @api_call = HomePageQueries.new
    @posts_antonia = @api_call.posts_antonia
    @posts_departmental = @api_call.posts_departmental
    @posts_ministers = @api_call.posts_ministers
    @howtos = @api_call.howtos
    @popular_posts = @api_call.popular_posts
    @people_finder_profile = PeopleFinderProfile.from_api(current_user)
  end
end
