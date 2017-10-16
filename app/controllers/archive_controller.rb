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
    @page = (params[:page] || 1).to_i
    init_pagination
    init_posts

    @categories = @api_call.other_categories_query
    @comments_headers = @api_call.main_comments_headers
  end

  def init_pagination
    headers = @api_call.main_query_headers(@page)
    @paginator =
      Paginator.new(@page, headers['x-wp-total'], headers['x-wp-totalpages'])
  end

  def init_posts
    @posts = @api_call.main_query(@page)

    @hero_post = @posts.first if @posts.first.is_a?(Hash)
    @posts = @posts[1..-1] || []
  end
end
