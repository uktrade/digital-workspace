def valid_omnni_auth_user
  OmniAuth::AuthHash.new(
    provider: 'ditsso_internal',
    info: {
      email: 'john@example.com',
      first_name: 'John',
      last_name: 'Doe'
    }
  )
end
