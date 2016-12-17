# require_relative 'seeders/posts_seeder'
# require_relative 'seeders/user_seeder'
#
# # generate all the users
# users_seeder = UserSeeder.new
# users_seeder.create_user_attributes(100)
# users_seeder.seed!
#
# # collect all user ids
# user_ids = User.pluck(:id)
#
# # create all the posts
# posts_seeder = PostsSeeder.new(user_ids)
# posts_seeder.create_post_attributes(100)
# posts_seeder.seed!
@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

puts "1 User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
