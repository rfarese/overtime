require 'rails_helper'
require_relative '../../db/seeders/posts_seeder'

RSpec.describe PostsSeeder do
  let(:seeder) { PostsSeeder.new }

  def add_post_seeds
    seeder.create_post_attributes(10)
    seeder.seed!
  end

  it "doesn't create duplicate records on multiple runs" do
    add_post_seeds
    initial_count = Post.count
    add_post_seeds

    expect(Post.count).to eq(initial_count)
  end

  describe "#create_post_attributes" do
    it "creates a set of post attributes for each post" do
      seeder.create_post_attributes(10)

      expect(seeder.posts_attributes.size).to eq(10)
    end
  end

  describe "#post_attributes" do
    it "creates a set of post attributes" do
      random_number = 1
      attributes = seeder.post_attributes(random_number)

      expect(attributes[:date]).to eq(Date.today - random_number.day)
      expect(attributes[:rationale]).to eq("This is the #{random_number} rationale")
    end
  end

  describe "#seed!" do
    it "saves the new posts to the databse" do
      seeder.create_post_attributes(5)

      expect(Post.count).to eq(0)
      seeder.seed!
      expect(Post.count).to eq(5)
    end
  end
end
