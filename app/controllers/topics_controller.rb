class TopicsController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = TopicThemeQueries.new(@slug)
    @topic_theme = @api_call.topic_theme_query

    init_topics
    init_topic_children
    init_related_news
    init_tools
  end

  protected

  def init_topics
    @slug = params[:path].split('/').last
    @api_call = TopicQueries.new(@slug)
    @topic = @api_call.topic_query
    @topic_selector = @api_call.topic_selector
    @parent_id = @topic.first['id']

    @global_notifications = @api_call.topic_query
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end

  def init_tools
    @slug = params[:path].split('/').last
    @api_call = ToolQueries.new
    # @topic_tools = @api_call.topic_query
    # @tools_id = @topic_tools.first['id']
    # @taxonomy = 'it-and-technical-support'

    # @tools_children_content = @api_call.tools_content_query(@tools_id, @taxonomy)
    # @tools_children_standard = @api_call.tools_standard_query(@tools_id, @taxonomy)
    # @tools = @api_call.tools_children(@tools_children_content, @tools_children_standard)
    @topic_tools = @api_call.topic_query
  end

  def init_related_news
    @slug = params[:path].split('/').last
    @api_call = TopicQueries.new(@slug)
    @related_news = @api_call.topics_related_news
  end

  def init_topic_children
    @slug = params[:path].split('/').last
    @api_call = TopicChildQueries.new(@slug)
    @topic_howdoi = @api_call.topic_howdoi_query
    @topic_policies = @api_call.topic_policies_query
    @topic_forms = @api_call.topic_forms_query
  end
end
