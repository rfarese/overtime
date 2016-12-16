require_relative 'seeders/posts_seeder'

posts_seeder = PostsSeeder.new
posts_seeder.create_post_attributes(100)
posts_seeder.seed!
