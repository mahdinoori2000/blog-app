class PostsController < ApplicationController
    def index
        user_id = params[:id]
        @posts = {
          id: user_id,
          post_text: 'this is the post text',
          likes: 5,
          comments: 8
        }
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