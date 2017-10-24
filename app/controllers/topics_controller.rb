class TopicsController < ApplicationController
  # def index
  #   @api_call = TopicQueries.new
  #   init_topics
  #   init_topic_children

  #   init_themes
  # end

  def index
    @slug = params[:path].split('/').last
    @api_call = TopicThemeQueries.new(@slug)
    @topic_theme = @api_call.topic_theme_query(@slug)

    init_topics
    init_topic_children
  end

  protected

  def init_topics
    @api_call = TopicQueries.new
    @topic = @api_call.topic_query
    @topic_selector = @api_call.topic_selector
  end

  def init_topic_children
    @api_call = TopicChildQueries.new(@slug)
    @topic_child = @api_call.topic_child_query
  end
end
