require 'rails_helper'

RSpec.feature "Posts index page", :type => :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario "User visits the posts index page" do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  scenario 'Page has a title of Posts' do
    login_as(user, scope: :user)
    visit posts_path
    expect(page).to have_content("Posts")
  end

  scenario "Page has a list of all the Posts" do
    login_as(user, scope: :user)
    post1 = Post.create(date: Date.today, rationale: "Post1", user_id: user.id)
    post2 = Post.create(date: Date.today, rationale: "Post2", user_id: user.id)
    visit posts_path
    
    expect(page).to have_content("Post1")
    expect(page).to have_content("Post2")
  end

  describe 'creation' do
    before do
      login_as(user, scope: :user)
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

    it 'will have a user associated it' do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "User Association"
      click_button "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
