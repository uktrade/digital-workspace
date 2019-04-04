class SessionsController < ApplicationController
  skip_before_action :ensure_sso_user, only: [:create]

  def create
    session[:ditsso_user_id] =
      AuthUser.from_omniauth_hash(request.env['omniauth.auth']).ditsso_user_id
    redirect_to(request.env['omniauth.origin'] || '/')
  end
end
