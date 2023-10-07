require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to a user' do
    should belong_to(:user).class_name('User')
  end

  it 'belongs to a post' do
    should belong_to(:post)
  end

  it 'updates the comments_counter attribute of the associated post' do
    user = User.create(name: 'Test User')
    post = user.posts.create(title: 'Test Post')

    comment1 = Comment.create(user:, post:, content: 'Comment 1')
    Comment.create(user:, post:, content: 'Comment 2')

    post.reload

    expect(post.comments_counter).to eq(2)

    comment1.destroy

    post.reload

    expect(post.comments_counter).to eq(1)
  end
end
