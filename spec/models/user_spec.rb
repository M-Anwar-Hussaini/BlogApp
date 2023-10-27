require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'recent_posts' do
    it 'returns the most recent 3 posts' do
      user = User.create(name: 'Test User')
      # Create some test posts for the user with different creation times
      user.posts.create(title: 'Post 1', created_at: 3.days.ago)
      post2 = user.posts.create(title: 'Post 2', created_at: 2.days.ago)
      post3 = user.posts.create(title: 'Post 3', created_at: 1.day.ago)
      post4 = user.posts.create(title: 'Post 4', created_at: Time.now)

      recent_posts = user.recent_posts

      expect(recent_posts).to eq([post4, post3, post2])
    end
  end
end
