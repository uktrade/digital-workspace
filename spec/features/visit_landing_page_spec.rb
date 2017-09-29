require 'rails_helper'

describe 'visit the landing page', vcr: true do
  scenario 'in general' do
    visit '/'

    expect(page).to have_link('Peoplefinder')
    expect(page).to have_css('h2', text: 'What\'s popular?')
  end
end
