FactoryGirl.define do
  factory :post do
    sequence(:date) { |n| Date.today - n.day }
    sequence(:rationale) { |n| "Some Rationale #{n}" }
    user
  end
end
