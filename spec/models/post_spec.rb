require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_valid(:date).when(Date.today, Date.today - 1.day )}
  it { should_not have_valid(:date).when(nil, "") }

  it { should have_valid(:rationale).when("This is a rationale", "Something 123" )}
  it { should_not have_valid(:date).when(nil, "") }
end
