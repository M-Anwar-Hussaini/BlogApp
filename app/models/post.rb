class Post < ApplicationRecord

  belongs_to :user
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end

end
