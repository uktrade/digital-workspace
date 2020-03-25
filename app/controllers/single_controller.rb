# frozen_string_literal: true

class SingleController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @posts = @api_call.main_query
  end

  def news
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @posts = @api_call.main_query
    process_form_submission
    @categories = @api_call.other_categories_query
    @comments_disabled = @posts.first && @posts.first['comment_status'] == 'closed'

    @global_notifications = @api_call.main_query
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end

  def comments_post
    post_body = {
      'post' => params[:post],
      'author_email' => params[:author_email],
      'author_name' => params[:author_name],
      'content' => params[:comment_content],
      'parent' => params[:comment_parent]
    }
    @response = WpApi.post_comment_json(post_body)
  end

  def comments_print
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @comments = @api_call.main_query
    @comments_id = @comments.first['id']
    @comments = @api_call.main_comments_query(@comments_id)
  end

  def comments_print_cache
    @slug = params[:path].split('/').last
    @api_call = PageQueries.new(@slug)
    @comments = @api_call.main_query
    @comments_id = @comments.first['id']
    @comments = @api_call.main_comments_query_cache(@comments_id)
  end

  protected

  def process_form_submission
    if params[:commit] == 'Submit comment'
      comments_post
      comments_print
    else
      comments_print_cache
    end
  end
end
