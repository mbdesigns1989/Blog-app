class UsersController < ActionController::Base
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.last_posts
  end
end
