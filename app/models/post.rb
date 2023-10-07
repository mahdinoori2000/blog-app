class Post < ApplicationRecord
    belongs_to :author, class_name: "User" 
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    def five_recent_comments
        comments.order(created_at: :dec).limit(5)
    end
    def update_comment_counter
        update(comments_counter: comments.size)
    end
    def update_like_counter
        update(likes_counter: likes.size)
    end
end