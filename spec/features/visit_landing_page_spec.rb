require 'rails_helper'

describe 'visit the landing page', vcr: true do
  scenario 'in general' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:ditsso_internal] = valid_user
    visit '/'

    expect(page).to have_link('Digital Workspace')
    expect(page).to have_css('h2', text: 'What\'s popular?')
  end
end

def valid_user
  OmniAuth::AuthHash.new(
    provider: 'ditsso_internal',
    info: {
      email: 'john@example.com',
      first_name: 'John',
      last_name: 'Doe'
    }
  )
end
