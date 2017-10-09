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
