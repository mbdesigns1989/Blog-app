class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @all_posts = @user.recent_posts
    render '_empty_list' if @all_posts.blank?
  end
end
