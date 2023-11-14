class CommentsController < ApplicationController
  before_action :set_user
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = @user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was add successfully.'
    else
      render :new, notice: 'There was a problem'
    end
  end

  private

  def set_user
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
