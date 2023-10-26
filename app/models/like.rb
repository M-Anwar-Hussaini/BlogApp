class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_likes

  private

  def increment_likes
    post.increment!(:likes_counter)
  end
end