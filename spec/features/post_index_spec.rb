require 'rails_helper'
​
RSpec.describe 'Posts index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'User 1', photo: 'https://picsum.photos/300/300', bio: 'User 1 bio', posts_counter: 0)
    @post1 = Post.create(title: 'Post 1', text: 'Post 1 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'Post 2', text: 'Post 2 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Post 3', text: 'Post 3 text', author: @user, comments_counter: 0, likes_counter: 0)
​
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 1')
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 2')
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 3')
​
    Like.create(user_id: @user.id, post_id: @post1.id)
    Like.create(user_id: @user.id, post_id: @post1.id)
    Like.create(user_id: @user.id, post_id: @post1.id)
​
    visit user_posts_path(@user)
  end

  scenario 'I can see the users profile picture.' do
    profile = all('img')
    expect(profile.size).to eq(1)
  end
end