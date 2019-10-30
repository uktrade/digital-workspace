# frozen_string_literal: true

class ArchiveController < ApplicationController
  def index
    @api_call = NewsQueries.new
    init_defaults
  end

  def howdoi
    @api_call = HowdoiQueryAll.new
  end

  def news_type
    @slug = params[:path].split('/').last
    @api_call = NewsTypeQueries.new(@slug)

    init_defaults
    init_category_titles
  end

  protected

  def init_defaults
    @page = (params[:page] || 1).to_i

    init_pagination
    init_posts
    init_categories
    init_comment_headers
  end

  def init_pagination
    headers = @api_call.main_query_headers(@page)
    @paginator =
      Paginator.new(@page, headers['x-wp-total'], headers['x-wp-totalpages'])
  end

  def init_posts
    @posts = @api_call.main_query(@page)

    @global_notifications = @api_call.main_query(@page)
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)

    @hero_post = @posts.first if @posts.first.is_a?(Hash)
    @posts = @posts[1..-1] || []
  end

  def init_categories
    @categories = @api_call.other_categories_query
  end

  def init_category_titles
    @slug = params[:path].split('/').last
    @category_title = @api_call.category_title_query(@slug)
  end

  def init_comment_headers
    @comments_headers = @api_call.main_comments_headers
  end
end
