class UserSeeder
  attr_reader :users_attributes

  def initialize(users_attributes=[])
    @users_attributes = users_attributes
  end

  def create_user_attributes(number_of_users)
    if number_of_users > 0
      new_user_attributes = user_attributes(number_of_users)
      users_attributes << new_user_attributes
      number_of_users -= 1
      create_user_attributes(number_of_users)
    end
  end

  def user_attributes(number_of_users)
    { first_name: "Joe #{number_of_users}",
      last_name: "Smith #{number_of_users}",
      email: "joesmith#{number_of_users}@google.com",
      password: "password",
      password_confirmation: "password" }
  end

  def seed!
    users_attributes.each do |user_attributes|
      user = User.find_or_initialize_by(user_attributes)
      user.save!
    end
  end
end
