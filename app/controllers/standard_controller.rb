class StandardController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @slug = current_url_without_parameters.split('/').last
    @api_call = StandardQueries.new(@slug)
    @content = @api_call.main_query(@slug)
    @topics = @api_call.topics_query
  end
end
