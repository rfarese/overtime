require 'rails_helper'

describe 'navigate' do
  let(:post)  { FactoryGirl.create(:post) }
  let(:post2) { FactoryGirl.create(:post) }
  let(:user)  { post.user }
  let(:user2) { post2.user }

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      post
      post2
      visit posts_path
    end

  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
  	end

    it 'has a list of posts' do
      expect(page).to have_content(post.rationale)
    end

    it 'has a scope so that only post creators can see their posts' do
      expect(page).to have_content(post.rationale)
      expect(page).to_not have_content(post2.rationale)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path

      click_link "delete_post_#{post.id}_from_index"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
  	before do
  		visit new_post_path
  	end

  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content("Some rationale")
  	end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(Post.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      user2
      login_as(user2, scope: :user)
      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end
