class PeopleFinderProfile
  BASE_URL = ENV['PEOPLEFINDER_API_URL']
  AUTH_TOKEN = ENV['PEOPLEFINDER_AUTH_TOKEN']

  attr_accessor(
    :email,
    :name,
    :given_name,
    :surname,
    :team,
    :completion_score,
    :profile_image_url,
    :profile_url
  )

  class << self
    def from_api(user)
      @email = user.is_a?(AuthUser) ? user.email : user.to_s
      retrieve_user
      assign_user
      @profile
    end

    private

    def retrieve_user
      response = Typhoeus.get(
        "#{URI.join(BASE_URL, '/api/people')}?email=#{@email}",
        headers: {
          'Authorization' => "Token token=#{AUTH_TOKEN}"
        }
      )

      response = response.success? ? JSON.parse(response.body) : {}
      @links = response['data'] ? response['data']['links'] : {}
      @attributes = response['data'] ? response['data']['attributes'] : {}
    end

    def assign_user
      @profile = PeopleFinderProfile.new
      @profile.email = @email
      @profile.name = @attributes['name']
      @profile.given_name = @attributes['given-name']
      @profile.surname = @attributes['surname']
      @profile.team = @attributes['team']
      @profile.completion_score = @attributes['completion-score'] || 0
      @profile.profile_image_url = @links['profile-image-url']
      @profile.profile_url = people_finder_my_profile_url
    end

    def people_finder_my_profile_url
      URI.join(PeopleFinderProfile::BASE_URL, 'my/profile').to_s
    end
  end
end
