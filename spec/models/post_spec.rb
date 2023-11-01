require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'The post without a title should not be valid' do
    post = Post.new
    expect(post).to_not be_valid
  end

  it 'The post with title should be valid' do
    post = Post.new(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end
end
