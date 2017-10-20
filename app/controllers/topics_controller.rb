class TopicsController < ApplicationController
  def index
    @api_call = TopicQueries.new
    init_posts
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
