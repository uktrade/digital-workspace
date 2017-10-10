class SessionsController < ApplicationController
  skip_before_action :ensure_sso_user, only: [:create]

  def create
    session[:auth_user] = User.from_omniauth_hash(request.env['omniauth.auth'])
    redirect_to '/'
  end
end
