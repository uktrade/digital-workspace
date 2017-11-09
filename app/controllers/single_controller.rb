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
    if params[:commit] == 'Submit comment'
      comments_post
      comments_print
    else
      comments_print_cache
    end
    @categories = @api_call.other_categories_query

    @global_notifications = @api_call.main_query
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)

  end

  def comments_post
    post_body = {
      'post' => params[:post],
      'author_email' => @people_finder_profile.email,
      'author_name' => @people_finder_profile.name,
      'content' => params[:comment_content],
      'parent' => params[:comment_parent]
    }
    @response = WpApi.post_comment_json(post_body)
  end

  def comments_print
    @comments = @api_call.main_comments_query
    @comments_headers = @api_call.main_comment_headers
  end

  def comments_print_cache
    @comments = @api_call.main_comments_query_cache
    @comments_headers = @api_call.main_comment_headers_cache
  end
end
