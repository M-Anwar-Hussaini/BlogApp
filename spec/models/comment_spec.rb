require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    it 'increments comments_counter on post after create' do
      user = User.create(name: 'Test User')
      post = Post.create(title: 'Test Post')
      comment = Comment.create(user:, post:, text: 'Test Comment')

      expect { comment.increment_comments }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
