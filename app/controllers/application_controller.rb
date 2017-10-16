require 'httparty'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_sso_user
  before_action :load_people_finder_profile

  def current_user
    User.new(session[:auth_user])
  end

  private

  def ensure_sso_user
    session[:auth_user] || redirect_to('/auth/ditsso_internal/')
  end

  def load_people_finder_profile
    @people_finder_profile = PeopleFinderProfile.from_api(current_user)
  end
end
