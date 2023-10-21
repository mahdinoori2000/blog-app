class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts
  end

  def show
    post_id = params[:post_id]
    user_id = params[:id]
    @post = {
      post_id:,
      user_id:,
      post_text: 'this is post text',
      comments: 5
    }
  end
end
