class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts
  end

  def show
    user_id = params[:user_id]
    @user = User.find(user_id)
    @post = @user.posts.find(params[:id])
  end
end
