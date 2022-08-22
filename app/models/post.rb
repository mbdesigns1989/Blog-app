class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 4..250 }
  validates :commentscounter, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, comparison: { greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_create :update_posts_count

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  after_create :update_post_counter

  def update_post_counter
    author.update(postscounter: author.postscounter + 1)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
