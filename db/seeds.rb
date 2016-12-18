@user = User.create(email: "user@user.com", password: "password", password_confirmation: "password", first_name: "User", last_name: "User")

puts "1 User created"

AdminUser.create(email: "admin@admin.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "User")

puts "1 Admin User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
