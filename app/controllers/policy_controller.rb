# frozen_string_literal: true

class PolicyController < ApplicationController
  def index
    @api_call = PolicyQueries.new
  end

  def content
    @slug = params[:path].split('/').last
    @api_call = PolicyQueries.new(@slug)
    @content = @api_call.policy_query
    @related_news = @api_call.topics_related_news

    @global_notification = @content.first if @content.first.is_a?(Hash)
  end
end
