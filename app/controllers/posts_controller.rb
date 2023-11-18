class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = Post.includes(:user).where(user: @user).references(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_path(current_user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to user_posts_path(@user, @post), notice: 'The post was successfully deleted.'
  end

  private

  def set_user
    @user = User.includes(posts: :comments).find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
