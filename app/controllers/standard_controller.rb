class StandardController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @slug = current_url_without_parameters.split('/').last
    @api_call = StandardQueries.new(@slug)
    @content = @api_call.main_query(@slug)
    @parent_id = @content.first['id']
    @content_children_content = @api_call.standard_child_content_query(@parent_id)
    @content_children_standard = @api_call.standard_child_standard_query(@parent_id)
    @content_children = @api_call.content_children(@content_children_content, @content_children_standard)

    build_global_notification
  end

  protected

  def build_global_notification
    @global_notifications = @api_call.main_query(@slug)
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end
end
