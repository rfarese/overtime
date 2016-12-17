FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, class: "AdminUser" do
    sequence(:email) { |n| "adminuser#{n}@example.com" }
    sequence(:first_name) { |n| "Admin#{n}" }
    sequence(:last_name) { |n| "User#{n}" }
    password "password"
    password_confirmation "password"
  end
end
