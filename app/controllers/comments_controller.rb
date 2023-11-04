# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = @user.comments.build(comment_params)
    @post = @user.posts.find(params[:post_id])

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text)
      .merge(post_id: params[:post_id])
  end
end
