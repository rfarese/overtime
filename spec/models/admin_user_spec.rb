require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a type of AdminUser' do
    admin = AdminUser.new

    expect(admin.type).to eq("AdminUser")
  end
end
