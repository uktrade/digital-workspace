require 'rails_helper'

describe 'visit the landing page' do
  scenario 'in general' do
    visit '/'

    expect(page).to have_link('Peoplefinder')
    expect(page).to have_css('h1', text: 'Home page')
  end
end
