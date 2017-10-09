require 'rails_helper'

describe 'visit the landing page', vcr: true do
  scenario 'in general' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:ditsso_internal] = valid_omnni_auth_user
    visit '/'

    expect(page).to have_link('Digital Workspace')
    expect(page).to have_css('h2', text: 'What\'s popular?')
  end
end
