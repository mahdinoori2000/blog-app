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

  def new
    @current_user = current_user
    @post = @current_user.posts.new
  end

  def create
    @current_user = current_user
    @post = current_user.posts.new(post_params.merge(comments_counter: 0, likes_counter: 0))
    if @post.save
      redirect_to user_post_url(@current_user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
