class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comments

  private

  def increment_comments
    post.increment!(:comments_counter)
  end
end
