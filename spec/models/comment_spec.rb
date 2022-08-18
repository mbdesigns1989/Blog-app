require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @author = User.new(name: 'mb', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Dev.',
                       postscount: 0)
    @author.save
    @post = Post.new(author: @author, title: 'Post Title', text: 'Post Text', commentscounter: 0, likescounter: 0)
    @post.save
    @comment = Comment.new(author: @author, text: 'Comment Text', post: @post)
    @comment.save
  end

  it 'should have a update_comments_counter method that increments the post\'s comment counter by 1' do
    expect(@post.commentscounter).to eq(1)
    @comment.update_comments_counter
    expect(@post.commentscounter).to eq(2)
  end
end
