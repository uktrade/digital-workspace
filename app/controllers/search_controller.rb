class SearchController < ApplicationController
  def index
    @query_str = params
    if !params['s']?nil:
      @string = params['s']
    end
    @api_call = SearchResultsQuery.new(params)
    @posts = @api_call.results_query
    @headers = @api_call.results_headers
  end
end
