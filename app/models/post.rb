class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_recent_comments
    comments.order(created_at: :dec).limit(5)
  end

  def update_comment_counter
    update(comments_counter: comments.size)
  end

  def update_like_counter
    update(likes_counter: likes.size)
  end

  def update_post_counter
    update(posts_counter: posts.size)
  end
end
