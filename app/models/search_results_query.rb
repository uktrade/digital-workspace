class SearchResultsQuery
  def initialize(params)
    @params = params
  end

  def results_query
    WpApi.get_search_json_body(@params) unless @params[:s].nil?
  end

  def results_headers
    WpApi.get_search_json_headers(@params) unless @params[:s].nil?
  end
end
