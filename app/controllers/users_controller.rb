class UsersController < ApplicationController
  def index; end

  def user
    user_id = params[:id]
    @user = {
      id: user_id,
      name: 'mahdi noori',
      bio: 'This is the bio of the user'
    }
  end

  def posts
    user_id = params[:id]
    @posts = {
      id: user_id,
      post_text: 'this is the post text',
      likes: 5,
      comments: 8
    }
  end

  def post
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
