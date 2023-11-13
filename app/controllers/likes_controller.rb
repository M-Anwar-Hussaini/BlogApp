class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to @like.post, notice: "Post liked"
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
