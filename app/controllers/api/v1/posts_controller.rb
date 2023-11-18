class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: current_user).references(:user)
    render json: @posts
  end
end
