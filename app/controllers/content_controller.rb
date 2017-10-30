class ContentController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @api_call = ContentQueries.new
    init_posts
  end

  def content
    @slug = current_url_without_parameters.split('/').last
    @api_call = ContentSingleQuery.new(@slug)
    @content = @api_call.type_query
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
