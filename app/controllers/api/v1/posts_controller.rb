class Api::V1::PostsController < ApplicationController
  def index
    @posts = current_user.posts
    render json: @posts
  end
end
