require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it { should have_valid(:first_name).when("Bobby", "Sarah" )}
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Farese", "Smith") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when("email@yahoo.com", "rfarese@gmail.com") }
  it { should_not have_valid(:email).when(nil, "", "userMan", "uManDude.com", "@com") }

  it 'has a matching password confirmation for the password' do
    new_user = User.new
    new_user.password = 'password'
    new_user.password_confirmation = 'anotherpassword'

    expect(new_user).to_not be_valid
    expect(new_user.errors[:password_confirmation]).to_not be_blank
  end

  describe "#full_name" do
    it 'combines first and last name' do
      expect(user.full_name).to eq("#{user.last_name.upcase}, #{user.first_name.upcase}")
    end
  end
end
