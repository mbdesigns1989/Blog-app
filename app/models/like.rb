class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create -> { update_post_likes_counter(:increment) }
  after_destroy -> { update_post_likes_counter(:decrement) }

  def update_post_likes_counter(operation)
    if operation == :increment
      post.increment!(:likescounter)
    else
      post.decrement!(:likescounter)
    end
  end
end
