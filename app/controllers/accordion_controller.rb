class AccordionController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = AccordionQueries.new(@slug)
    @howdois = @api_call.main_query(@slug)
    @howdois_topic = @api_call.howdois_topic_query
  end
end
