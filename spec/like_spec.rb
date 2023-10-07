require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to a post' do
    should belong_to(:post)
  end

  it 'belongs to a user' do
    should belong_to(:user)
  end

  it 'updates the likes_counter attribute of the associated post' do
    user = User.create(name: 'Test User')
    post = user.posts.create(title: 'Test Post')

    like1 = Like.create(user:, post:)
    Like.create(user:, post:)

    post.reload

    expect(post.likes_counter).to eq(2)

    like1.destroy

    post.reload

    expect(post.likes_counter).to eq(1)
  end
end
