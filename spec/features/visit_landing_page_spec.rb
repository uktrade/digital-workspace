require 'rails_helper'

describe 'visit the landing page', vcr: true do
  before do
    login_as_omniauth_user
  end

  scenario 'in general' do
    visit '/'

    expect(page).to have_link('Digital Workspace')
    expect(page).to have_css('h2', text: 'What\'s popular?')

    within('.profile-overview') do
      expect(page).to have_link('Update', href: "#{ENV['PEOPLEFINDER_URL']}/my/profile")
    end

    within('.welcome-people-finder') do
      form = find('form#people_search')
      expect(form['action']).to eq("#{ENV['PEOPLEFINDER_URL']}/search")
    end
  end
end
