FactoryGirl.define do
  factory :post do
    date Date.today
    sequence(:rationale) { |n| "Some Rationale #{n}" }
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Yesterdays rationale"
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    user
  end
end
