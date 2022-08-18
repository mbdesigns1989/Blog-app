class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentscounter, :likescounter, numericality: { greater_than_or_equal_to: 0 }

  after_create :update_author_posts_count

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def update_author_posts_count
    author.postscount.nil? ? author.update(postscount: 1) : author.update(postscount: author.postscount + 1)
  end

  def liked?(user)
    likes.where(author: user).any?
  end
end
