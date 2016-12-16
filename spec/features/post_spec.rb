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

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"
      click_button "Save"

      expect(page).to have_content("Some rationale")
    end
  end
end