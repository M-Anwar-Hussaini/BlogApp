require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'recent_comments' do
    it 'returns the most recent 3 comments' do
      user = User.create(name: 'Test User')
      post = Post.create(title: 'Test Post', author: user)
      # Create some test comments for the post with different creation times
      post.comments.create(text: 'Comment 1', created_at: 3.days.ago)
      comment2 = post.comments.create(text: 'Comment 2', created_at: 2.days.ago)
      comment3 = post.comments.create(text: 'Comment 3', created_at: 1.day.ago)
      comment4 = post.comments.create(text: 'Comment 4', created_at: Time.now)

      recent_comments = post.recent_comments

      expect(recent_comments).to eq([comment4, comment3, comment2])
    end
  end
end
