class PolicyController < ApplicationController
  def index
    @api_call = PolicyQueries.new
    init_posts
  end

  def content
    @slug = params[:path].split('/').last
    @api_call = PolicyQueries.new(@slug)
    @content = @api_call.policy_query
    @related_news = @api_call.topics_related_news
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
