class SessionsController < ApplicationController
  skip_before_action :ensure_sso_user, only: [:create]

  def create
    auth_user = AuthUser.from_omniauth_hash(request.env['omniauth.auth'])
    session[:ditsso_user_id] = auth_user.ditsso_user_id
    session[:email] = auth_user.email

    redirect_to(request.env['omniauth.origin'] || '/')
  end
end
