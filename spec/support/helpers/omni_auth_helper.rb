def valid_omnni_auth_user
  OmniAuth::AuthHash.new(
    provider: 'ditsso_internal',
    info: {
      email: 'alice@example.com',
      first_name: 'Alice',
      last_name: 'Arnold'
    }
  )
end

def login_as_omni_auth_user
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:ditsso_internal] = valid_omnni_auth_user
end
