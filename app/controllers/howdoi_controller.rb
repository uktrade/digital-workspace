class HowdoiController < ApplicationController
  def index
    @api_call = HowdoiQueries.new
    init_posts
  end

  def content
    @slug = params[:path].split('/').last
    @api_call = HowdoiQueries.new(@slug)
    @content = @api_call.howdoi_query
    @related_news = @api_call.topics_related_news

    @global_notifications = @api_call.howdoi_query
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end

  protected

  def init_posts
    @posts = @api_call.main_query
  end
end
