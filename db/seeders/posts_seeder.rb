class PostsSeeder
  attr_reader :posts_attributes

  def initialize(posts_attributes=[])
    @posts_attributes = posts_attributes
  end

  def create_post_attributes(number_of_posts)
    if number_of_posts > 0
      new_post_attributes = post_attributes(number_of_posts)
      posts_attributes << new_post_attributes
      number_of_posts -= 1
      create_post_attributes(number_of_posts)
    end
  end

  def post_attributes(number_of_posts)
    { date: Date.today - number_of_posts.day,
      rationale: "This is the #{number_of_posts} rationale" }
  end

  def seed!
    posts_attributes.each do |post_attributes|
      post = Post.find_or_initialize_by(post_attributes)
      post.save!
    end
  end
end
