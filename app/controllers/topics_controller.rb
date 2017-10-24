class TopicsController < ApplicationController
  def index
    @api_call = TopicQueries.new
    init_posts
  end

  protected

  def init_posts
    @topic_parent = @api_call.topic_parent_query
    @topic_child = @api_call.topic_child_query
  end
end
