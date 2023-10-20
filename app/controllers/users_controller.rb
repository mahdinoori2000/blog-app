class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user_id = params[:id]
    @user = {
      id: user_id,
      name: 'mahdi noori',
      bio: 'This is the bio of the user'
    }
  end
end
