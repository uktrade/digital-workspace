class SearchController < ApplicationController
  def index
    @query_str = params
    (@string = params['s']) unless params['s'].nil?
    @api_call = SearchResultsQuery.new(params)
    @posts = @api_call.results_query
    @headers = @api_call.results_headers
    @categories = news_categories
    @work_categories = working_at_dit_categories
  end

  def news_categories
    WpApi.get_json_body('news_categories')
  end

  def working_at_dit_categories
    WpApi.get_json_body('theme_taxonomy')
  end
end
