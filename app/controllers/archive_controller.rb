class ArchiveController < ApplicationController
  def index
    @api_call = NewsQueries.new

    init_defaults

    @id = params[:id]
  end

  def news_type
    @slug = params[:path].split('/').last
    @api_call = NewsTypeQueries.new(@slug)

    init_defaults
  end

  protected

  def init_defaults
    @posts = @api_call.main_query(params[:page] || 1)
    @categories = @api_call.other_categories_query
    @posts_headers = @api_call.main_query_headers
    @comments_headers = @api_call.main_comments_headers
  end
end
