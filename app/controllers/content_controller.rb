class ContentController < ApplicationController
  def index
    @api_call = ContentQueries.new
    init_posts
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
