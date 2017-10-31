class StandardController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @slug = current_url_without_parameters.split('/').last
    @api_call = StandardQueries.new(@slug)
    @content = @api_call.main_query(@slug)
    @content_children = @api_call.standard_child_query(@slug)
  end
end
