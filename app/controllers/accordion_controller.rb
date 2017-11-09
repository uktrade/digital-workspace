class AccordionController < ApplicationController
  def current_url_without_parameters
    request.base_url + request.path
  end

  def index
    @slug = current_url_without_parameters.split('/').last
    @api_call = AccordionQueries.new(@slug)
    @accordion = @api_call.main_query(@slug)
    @accordion_theme = @api_call.accordion_theme_query(@parent_slug)

    @global_notifications = @api_call.main_query(@slug)
    @global_notification = @global_notifications.first if @global_notifications.first.is_a?(Hash)
  end
end
