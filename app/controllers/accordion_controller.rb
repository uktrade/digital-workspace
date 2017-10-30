class AccordionController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @slug = current_url_without_parameters.split('/').last
    @api_call = AccordionQueries.new(@slug)
    @howdois = @api_call.main_query
    @howdois_theme = @api_call.howdois_theme_query
    @howdois_topics = @api_call.howdois_topic_query
  end
end
