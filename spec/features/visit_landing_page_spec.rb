require 'rails_helper'

describe 'visit the landing page', vcr: true do
  before do
    login_as_omni_auth_user
  end

  scenario 'in general' do
    visit '/'

    expect(page).to have_link('Digital Workspace')
    expect(page).to have_css('h2', text: 'What\'s popular?')

    within('.profile-overview') do
      expect(page).to have_css('h3', text: 'Alice Arnold')
      expect(page).to have_link('Update')
    end
  end
end
