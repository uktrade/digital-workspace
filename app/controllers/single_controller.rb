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

    if params[:commit] == "Submit comment"
      post_body = { "post" => params[:post], "author_email" => @people_finder_profile.email, "author_name" => @people_finder_profile.name, "content" => params[:comment_content], "parent" => params[:comment_parent] }
      @response = WpApi.post_comment_json(post_body)
    end

    @comments = @api_call.main_comments_query
    @comments_headers = @api_call.main_comment_headers
    @categories = @api_call.other_categories_query
  end
end
