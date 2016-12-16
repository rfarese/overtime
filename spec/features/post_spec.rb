require 'rails_helper'

RSpec.feature "Posts index page", :type => :feature do
  scenario "User visits the posts index page" do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  scenario 'Page has a title of Posts' do
    visit posts_path
    expect(page).to have_content("Posts")
  end
end
