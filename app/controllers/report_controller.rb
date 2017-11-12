class ReportController < ApplicationController
<<<<<<< HEAD
  require 'zendesk_api'
  require 'json'

  def index
    client = zendesk_client
    client.tickets.create(
      subject: "Website error submission #{Time.now}",
      comment: {
        value: params['problem_report_problem']
      },
      submitter_id: client.current_user.id,
      priority: 'normal', type: 'incident', custom_fields: zendesk_request_fields
    )
    redirect_back fallback_location: '/'
  end

  def zendesk_client
    ZendeskAPI::Client.new do |config|
=======

  def index
    require 'zendesk_api'
    require 'json'

    @params = params

    client = ZendeskAPI::Client.new do |config|
>>>>>>> got this successfully posting to test account, but needs correct information and styling
      config.url = ENV['ZD_URL']
      config.username = ENV['ZD_USER']
      config.password = ENV['ZD_PASS']
      config.retry = true
      require 'logger'
      config.logger = Logger.new(STDOUT)
    end
<<<<<<< HEAD
  end

  def zendesk_request_fields
    [{
      id: '114101595573', value: params['problem_report_goal']
    }, {
      id: '114101595593', value: params['problem_report_problem']
    }, {
      id: '114101595613', value: params['problem_report_origin']
    }, {
      id: '114101582834', value: params['problem_report_browser']
    }]
=======

    client.tickets.create(:subject => "Website error submission #{Time.now}", :comment => { :value => params['problem_report_problem']}, :submitter_id => client.current_user.id, :priority => "normal", :type => "incident", :custom_fields => [{:id => "114101595573", :value => params['problem_report_goal']},{:id => "114101595593", :value => params['problem_report_problem']},{:id => "114101595613", :value => params['problem_report_origin']},{:id => "114101582834", :value => params['problem_report_browser']}])
    redirect_back fallback_location: '/'
>>>>>>> got this successfully posting to test account, but needs correct information and styling
  end
end
