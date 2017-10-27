class TopicsController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = TopicThemeQueries.new(@slug)
    @topic_theme = @api_call.topic_theme_query

    init_topics
    init_topic_children
  end

  protected

  def init_topics
    @slug = params[:path].split('/').last
    @api_call = TopicQueries.new(@slug)
    @topic = @api_call.topic_query
    @topic_selector = @api_call.topic_selector
  end

  def init_topic_children
    @slug = params[:path].split('/').last
    @api_call = TopicChildQueries.new(@slug)
    @topic_howdoi = @api_call.topic_howdoi_query
    @topic_policies = @api_call.topic_policies_query
    @topic_forms = @api_call.topic_forms_query
  end
end
