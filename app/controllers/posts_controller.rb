class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_path(@user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.includes(posts: :comments).find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
