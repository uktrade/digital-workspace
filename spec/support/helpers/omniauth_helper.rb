def valid_omnniauth_user
  OmniAuth::AuthHash.new(
    provider: 'ditsso_internal',
    info: {
      email: 'alice@example.com',
      first_name: 'Alice',
      last_name: 'Arnold'
    },
    uid: 'deadbeef'
  )
end

def login_as_omniauth_user
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:ditsso_internal] = valid_omnniauth_user
end
