class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @text = 'Here is some comments'
    @comment = Comment.new(user: @user, post: @post, text: @text)

    if @comment.save
      render json: @comment, adapter: :json
    else
      render json: { error: 'Could not add comment' }
    end
  end
end
