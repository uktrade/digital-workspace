require 'httparty'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_sso_user

  def current_user
    User.new(session[:auth_user])
  end

  private

  def ensure_sso_user
    session[:auth_user] || redirect_to('/auth/ditsso_internal/')
  end
end
