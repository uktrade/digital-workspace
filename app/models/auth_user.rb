class AuthUser
  include ActiveModel::Model

  attr_accessor(:email, :ditsso_user_id)

  class << self
    def from_omniauth_hash(auth_hash = {})
      AuthUser.new(ditsso_user_id: auth_hash['uid'])
    end
  end
end
