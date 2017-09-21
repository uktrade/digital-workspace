require 'rails_helper'

feature "visit the landing page" do
  scenario "in general" do
    visit "/"

    expect(page).to have_css("h1", "DIT Digital Workspace")
  end
end
