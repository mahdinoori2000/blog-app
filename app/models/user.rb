class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def three_recent_posts
    posts.order(created_at: :dec).limit(3)
  end

  def update_post_counter
    update(posts_counter: posts.size)
  end
end
