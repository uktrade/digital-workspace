# frozen_string_literal: true

class ToolsController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    slug_is_standard? ? standard : content
  end

  def standard
    @api_call = StandardQueries.new(@slug)
    @content = @api_call.main_query(@slug)
    @parent_id = @content.first['id']
    @content_children_content = @api_call.standard_child_content_query(@parent_id)
    @content_children_standard = @api_call.standard_child_standard_query(@parent_id)
    @content_children = @api_call.content_children(
      @content_children_content,
      @content_children_standard
    )

    build_global_notification
  end

  def content
    build_global_notification
    @api_call = ContentSingleQuery.new(@slug)
    @content = @api_call.type_query
    if @content.first['acf']['redirect_url']['url'].present?
      redirect_to @content.first['acf']['redirect_url']['url']
    else
      render template: 'content/content'
    end
  end

  protected

  def build_global_notification
    @test_slug = current_url_without_parameters.split('/').last
    @global_notifications = @api_call.notifications_query(@test_slug)
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end

  def slug_is_standard?
    @slug = current_url_without_parameters.split('/').last
    @api_call = StandardQueries.new(@slug)
    @content = @api_call.page_query(@slug)
    @type = @content.first['type']

    return true if @type == 'standard_index'
  end
end
