class PolicyController < ApplicationController
  def content
    @slug = params[:path].split('/').last
    @api_call = PolicyQueries.new(@slug)
    @content = @api_call.policy_query
  end
end
