class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  def last_posts
    Post.where(author: id).order(created_at: :desc).limit(3)
  end
end
