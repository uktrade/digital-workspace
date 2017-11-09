class SearchController < ApplicationController
  def index
    @query_str = params
    (@string = params['s']) unless params['s'].nil?
    @api_call = SearchResultsQuery.new(params)
    init_defaults unless @string.nil?
  end

  def init_defaults
    @posts = @api_call.results_query
    @headers = @api_call.results_headers
    @categories = news_categories
    @work_categories = working_at_dit_categories
    @page = (params[:page] || 1).to_i
    init_pagination
  end

  def init_pagination
    headers = @headers
    @paginator =
      Paginator.new(@page, headers['x-wp-total'], headers['x-wp-totalpages'])
  end

  def news_categories
    WpApi.get_json_body('news_categories')
  end

  def working_at_dit_categories
    WpApi.get_json_body('theme_taxonomy')
  end
end
