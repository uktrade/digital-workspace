# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_sso_user
  before_action :load_people_finder_profile

  def current_user
    AuthUser.new(ditsso_user_id: session[:ditsso_user_id], email: session[:email])
  end

  private

  def ensure_sso_user
    session[:ditsso_user_id] ||
      redirect_to("/auth/ditsso_internal?origin=#{ERB::Util.url_encode(request.fullpath)}")
  end

  def load_people_finder_profile
    @people_finder_profile = PeopleFinderProfile.from_api(current_user)
  end

  def redirect_from_content!
    return if @content.blank?

    wp_redirect = @content.first.dig('acf', 'redirect_url').presence || {}
    wp_redirect_url = wp_redirect['url']
    return if wp_redirect_url.blank?

    redirect_to(wp_redirect_url)
  end

  def append_info_to_payload(payload)
    super

    payload[:sso_user_id] = session[:ditsso_user_id]
  end
end
