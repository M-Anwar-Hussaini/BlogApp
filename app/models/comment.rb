class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comments_counter

  private

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end
