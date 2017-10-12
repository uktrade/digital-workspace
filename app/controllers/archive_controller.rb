class ArchiveController < ApplicationController
  def index
    @api_call = NewsQueries.new
    @posts = @api_call.main_query
    @categories = @api_call.other_categories_query
  end

  def news_type
    @slug = params[:path].split('/').last
    @api_call = NewsTypeQueries.new(@slug)
    @posts = @api_call.main_query
    @categories = @api_call.other_categories_query
  end
end
