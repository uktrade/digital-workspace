class ContentController < ApplicationController
  def index
    @api_call = ContentQueries.new
    init_posts
  end

  def content
    @slug = params[:path].split('/').last
    @api_call = ContentSingleQuery.new(@slug)
    @content = @api_call.type_query
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
