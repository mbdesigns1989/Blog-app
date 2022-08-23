class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  redirect_to user_post_path(current_user.id, @post.id) 

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def recent_5_comments
    comments.order(created_at: :DESC).limit(5)
  end

  # private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
