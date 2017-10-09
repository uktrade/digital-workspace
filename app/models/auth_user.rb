class AuthUser
  attr_reader :email, :name

  def initialize(auth_hash = {})
    user_hash = auth_hash[:info]

    @email = user_hash.email if user_hash
    @name = user_hash.name if user_hash
  end
end
