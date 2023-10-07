class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  def update_comment_counter
    update(comments_counter: comments.size)
  end
end
