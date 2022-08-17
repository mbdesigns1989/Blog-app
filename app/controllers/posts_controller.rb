class PostsController < ActionController::Base
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all
  end

  def show
    @post = Post.where(author_id: params[:user_id]).order(created_at: :asc)[params[:id].to_i - 1]
    @comments = Comment.where(post_id: params[:id])
    @user = User.find(@post.author_id)
  end
end
