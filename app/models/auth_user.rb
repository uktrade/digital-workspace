class AuthUser
  include ActiveModel::Model

  attr_accessor(
    :email
  )

  class << self
    def from_omniauth_hash(auth_hash = {})
      AuthUser.new(email: auth_hash[:info] ? auth_hash[:info][:email] : nil)
    end
  end
end
