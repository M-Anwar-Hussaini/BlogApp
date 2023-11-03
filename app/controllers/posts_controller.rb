class PostsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
end
