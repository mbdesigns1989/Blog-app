class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create :update_comments_counter

  def update_comments_counter
    post.commentscounter.nil? ? post.update(commentscounter: 1) : post.update(commentscounter: post.commentscounter + 1)
  end
end
