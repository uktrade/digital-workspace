require 'httparty'

class PeopleFinderProfile
  BASE_URL = ENV['PEOPLEFINDER_URL']
  AUTH_TOKEN = ENV['PEOPLEFINDER_AUTH_TOKEN']

  attr_accessor(
    :email,
    :name,
    :team,
    :completion_score,
    :profile_image_url,
    :profile_url
  )

  class << self
    def from_api(user)
      @email = user.email
      retrieve_user
      assign_user
      @profile
    end

    private

    def retrieve_user
      response = HTTParty.get(
        "#{URI.join(BASE_URL, '/api/people')}?email=#{@email}",
        headers: {
          'Authorization' => "Token token=#{AUTH_TOKEN}"
        }
      )
      @links = JSON.parse(response.body)['data']['links']
      @attributes = JSON.parse(response.body)['data']['attributes']
    end

    def assign_user
      @profile = PeopleFinderProfile.new
      @profile.email = @email
      @profile.name = @attributes['name']
      @profile.team = @attributes['team']
      @profile.completion_score = @attributes['completion-score'] || 0
      @profile.profile_image_url = @links['profile-image-url']
      @profile.profile_url = @links['profile'] || PeopleFinderProfile::BASE_URL
    end
  end
end
