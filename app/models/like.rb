class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :l_counter

  def l_counter
    id = post_id
    post = Post.find(id)
    post.update(likes_counter: Like.where(post_id: id).count)
  end
end
