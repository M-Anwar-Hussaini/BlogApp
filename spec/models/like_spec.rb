require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    it 'increments likes_counter on post after create' do
      user = User.create(name: 'Test User')
      post = Post.create(title: 'Test Post')
      like = Like.create(user:, post:)

      expect { like.increment_likes }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
