require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'mb', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Dev.',
                     postscount: 0)
    @user.save
  end

  it 'should have a name' do
    expect(@user.name).to eq('mb')
  end

  it 'should have a photo' do
    expect(@user.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'should have a bio' do
    expect(@user.bio).to eq('Full Stack Dev.')
  end

  it 'should not be valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without a posts counter greater or equal to 0' do
    @user.postscount = -1
    expect(@user).to_not be_valid
  end

  it 'should have a most_recent_posts method that returns the 3 most recent posts' do
    post1 = Post.new(author: @user, title: 'Post Title 1', text: 'Post Text 1', commentscounter: 0, likescounter: 0)
    post1.save
    post2 = Post.new(author: @user, title: 'Post Title 2', text: 'Post Text 2', commentscounter: 0, likescounter: 0)
    post2.save
    post3 = Post.new(author: @user, title: 'Post Title 3', text: 'Post Text 3', commentscounter: 0, likescounter: 0)
    post3.save
    post4 = Post.new(author: @user, title: 'Post Title 4', text: 'Post Text 4', commentscounter: 0, likescounter: 0)
    post4.save
    post5 = Post.new(author: @user, title: 'Post Title 5', text: 'Post Text 5', commentscounter: 0, likescounter: 0)
    post5.save
    expect(@user.most_recent_posts).to eq([post5, post4, post3])
  end
end
