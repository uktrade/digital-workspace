require 'rails_helper'

describe 'visit the news pages', vcr: true do
  before do
    login_as_omniauth_user
  end

  scenario 'in general' do
    visit '/'

    click_on 'View all News'
    expect(page).to have_current_path('/news-and-views/')
  end
end
