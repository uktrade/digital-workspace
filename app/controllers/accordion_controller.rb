class AccordionController < ApplicationController
  def index
    @slug = params[:path].split('/').last
    @api_call = AccordionQueries.new(@slug)
    @howdois = @api_call.main_query(@slug)
  end
end
