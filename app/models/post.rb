class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_create :update_posts_counter

  def get_recent_comments
    comments.order(created_at: desc).limit(3)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
