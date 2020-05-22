# frozen_string_literal: true

class PeopleFinderProfile
  BASE_URL = ENV['PEOPLEFINDER_API_URL']
  BASE_END_USER_URL = ENV['PEOPLEFINDER_URL']

  attr_accessor :name, :first_name, :email, :completion_score, :profile_url, :profile_image_url

  def self.from_api(user)
    # TODO: Figure out if this is still an issue
    return if user.ditsso_user_id.blank?

    request_path = "/api/v2/people_profiles/#{user.ditsso_user_id}"
    jwt = JWT.encode(
      { fullpath: request_path, exp: 1.minute.from_now.to_i },
      Rails.configuration.people_finder_api_private_key,
      'RS512'
    )
    response = Typhoeus.get(
      URI.join(BASE_URL, request_path),
      headers: {
        'Authorization' => "Bearer #{jwt}"
      }
    )

    result = response.success? ? JSON.parse(response.body) : {}

    PeopleFinderProfile.new(result)
  end

  def self.my_profile_url
    URI.join(BASE_END_USER_URL, 'my/profile').to_s
  end

  def initialize(params = {})
    @name = params['name']
    @first_name = params['first_name']
    @email = params['email']
    @completion_score = params['completion_score'] || 0
    @profile_url = params['profile_url']
    @profile_image_url = params['profile_image_url']
  end

  def present?
    email.present?
  end
end
