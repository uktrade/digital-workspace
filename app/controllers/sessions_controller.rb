class SessionsController < ApplicationController
  skip_before_action :ensure_sso_user, only: [:create]

  def create
    session[:auth_email] =
      AuthUser.from_omniauth_hash(request.env['omniauth.auth']).email
    redirect_to '/'
  end
end
