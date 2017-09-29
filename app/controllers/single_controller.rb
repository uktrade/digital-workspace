require 'wp_api'

class SingleController < ApplicationController
  def index
    @base_media_uri = 'https://uat-dit.useconnect.co.uk/wp-content/uploads/'

    @api_call = SingleQueries.new
    @posts = @api_call.main_query
  end
end
