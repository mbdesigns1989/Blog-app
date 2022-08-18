require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @author = User.new(name: 'mb', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Dev.',
                       postscount: 0)
    @author.save
    @post = Post.new(author: @author, title: 'Post Title', text: 'Post Text', commentscounter: 0, likescounter: 0)
    @post.save
  end

  it 'should have an author' do
    expect(@post.author).to eq(@author)
  end

  it 'should have a title' do
    expect(@post.title).to eq('Post Title')
  end

  it 'should have a text' do
    expect(@post.text).to eq('Post Text')
  end

  it 'should not be valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should not be valid with a title length greater than 250' do
    @post.title = 'x' * 251
    expect(@post).to_not be_valid
  end

  it 'should not be valid without a comments counter greater or equal to 0' do
    @post.commentscounter = -1
    expect(@post).to_not be_valid
  end

  it 'should not be valid without a likes counter greater or equal to 0' do
    @post.likescounter = -1
    expect(@post).to_not be_valid
  end

  it 'should have a most_recent_comments method that returns the 5 most recent comments' do
    comment1 = Comment.new(author: @author, text: 'Comment Text 1', post: @post)
    comment1.save
    comment2 = Comment.new(author: @author, text: 'Comment Text 2', post: @post)
    comment2.save
    comment3 = Comment.new(author: @author, text: 'Comment Text 3', post: @post)
    comment3.save
    comment4 = Comment.new(author: @author, text: 'Comment Text 4', post: @post)
    comment4.save
    comment5 = Comment.new(author: @author, text: 'Comment Text 5', post: @post)
    comment5.save
    comment6 = Comment.new(author: @author, text: 'Comment Text 6', post: @post)
    comment6.save
    comment7 = Comment.new(author: @author, text: 'Comment Text 7', post: @post)
    comment7.save
    expect(@post.most_recent_comments).to eq([comment7, comment6, comment5, comment4, comment3])
  end
end
