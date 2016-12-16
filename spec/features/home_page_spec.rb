require 'rails_helper'

RSpec.feature "Home page", :type => :feature do
  scenario "User visits the home page" do
    visit root_path

    expect(page.status_code).to eq(200)
  end
end
