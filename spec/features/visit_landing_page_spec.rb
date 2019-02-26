require 'rails_helper'

describe 'visit the landing page', vcr: true do
  before do
    login_as_omniauth_user
  end

  scenario 'in general' do
    visit '/'

    expect(page).to have_link('Digital Workspace')
    expect(page).to have_css('h2', text: 'What\'s popular?')

    within('.user-account') do
      expect(page).to have_link('Please set up your profile', href: "#{ENV['PEOPLEFINDER_URL']}/my/profile")
    end

    within('.people-search-inner-page') do
      form = find('form#people_search')
      expect(form['action']).to eq("#{ENV['PEOPLEFINDER_URL']}/search")
    end
  end
end
