class PostsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:id])
  end
end
