class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :p_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  def p_counter
    id = author_id
    user = User.find(id)
    user.update(posts_counter: Post.where(author: id).count)
  end

  def last_comments
    comments.order(created_at: :desc).limit(5)
  end
end
