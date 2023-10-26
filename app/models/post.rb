class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_create :increments_posts

  def recent_comments
    comments.order(created_at: desc).limit(3)
  end

  private

  def increments_posts
    author.increment!(:posts_counter)
  end
end
