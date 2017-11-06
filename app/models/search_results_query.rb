class SearchResultsQuery
  def initialize(params)
    @params = params
  end

  def results_query
  	if !@params[:s].nil?
  	  WpApi.get_search_json_body(@params)
  	end
  end

  def results_headers
    if !@params[:s].nil?
      WpApi.get_search_json_headers(@params)
    end
  end
end
