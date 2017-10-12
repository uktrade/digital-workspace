class ArchiveController < ApplicationController
  def index
    @api_call = NewsQueries.new
    @posts = @api_call.main_query
    @categories = @api_call.other_categories_query
    @posts_headers = @api_call.main_query_headers
    @comments_headers = @api_call.main_comments_headers
  end

  def news_type
    @slug = params[:path].split('/').last
    @api_call = NewsTypeQueries.new(@slug)
    @posts = @api_call.main_query
    @categories = @api_call.other_categories_query
  end
end
