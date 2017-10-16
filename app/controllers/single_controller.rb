class SingleController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @posts = @api_call.main_query
  end

  def news
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @posts = @api_call.main_query
    @comments = @api_call.main_comments_query
    @comments_headers = @api_call.main_comment_headers
    @categories = @api_call.other_categories_query
    @people_finder_profile = PeopleFinderProfile.from_api(current_user)
  end
end
