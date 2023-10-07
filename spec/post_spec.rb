# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates presence of title' do
    post = Post.new
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'validates maximum length of title' do
    post = Post.new(title: 'A' * 251)
    post.valid?
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')

    post.title = 'A' * 250
    post.valid?
    expect(post.errors[:title]).to be_empty
  end

  it 'validates comments_counter is an integer greater than or equal to zero' do
    post = Post.new(comments_counter: 5)
    post.valid?
    expect(post.errors[:comments_counter]).to be_empty

    post.comments_counter = -1
    post.valid?
    expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')

    post.comments_counter = 'not_an_integer'
    post.valid?
    expect(post.errors[:comments_counter]).to include('is not a number')
  end

  it 'validates likes_counter is an integer greater than or equal to zero' do
    post = Post.new(likes_counter: 5)
    post.valid?
    expect(post.errors[:likes_counter]).to be_empty

    post.likes_counter = -1
    post.valid?
    expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')

    post.likes_counter = 'not_an_integer'
    post.valid?
    expect(post.errors[:likes_counter]).to include('is not a number')
  end

  it 'returns five most recent comments' do
    user = User.create(name: 'Test User')
    post = user.posts.create(title: 'Test Post')
    comment1 = post.comments.create(content: 'Comment 1', created_at: 5.days.ago)
    comment2 = post.comments.create(content: 'Comment 2', created_at: 4.days.ago)
    comment3 = post.comments.create(content: 'Comment 3', created_at: 3.days.ago)
    comment4 = post.comments.create(content: 'Comment 4', created_at: 2.days.ago)
    comment5 = post.comments.create(content: 'Comment 5', created_at: 1.day.ago)
    comment6 = post.comments.create(content: 'Comment 6', created_at: 6.days.ago) # Should not be included

    recent_comments = post.five_recent_comments

    expect(recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
    expect(recent_comments).not_to include(comment6)
  end

  it 'updates the comments_counter attribute with the number of comments' do
    user = User.create(name: 'Test User')
    post = user.posts.create(title: 'Test Post')

    post.comments.create(content: 'Comment 1')
    post.update_comment_counter
    post.reload

    expect(post.comments_counter).to eq(1)

    post.comments.create(content: 'Comment 2')
    post.comments.create(content: 'Comment 3')
    post.update_comment_counter
    post.reload

    expect(post.comments_counter).to eq(3)
  end

  it 'updates the likes_counter attribute with the number of likes' do
    user = User.create(name: 'Test User')
    post = user.posts.create(title: 'Test Post')

    post.likes.create(user:)
    post.update_like_counter
    post.reload

    expect(post.likes_counter).to eq(1)

    post.likes.create(user:)
    post.likes.create(user:)
    post.update_like_counter
    post.reload

    expect(post.likes_counter).to eq(3)
  end

  it 'updates the posts_counter attribute with the number of posts' do
    user = User.create(name: 'Test User')

    user.posts.create(title: 'Post 1')
    user.posts.create(title: 'Post 2')
    user.update_post_counter
    user.reload

    expect(user.posts_counter).to eq(2)

    user.posts.create(title: 'Post 3')
    user.update_post_counter
    user.reload

    expect(user.posts_counter).to eq(3)
  end

  # Add more tests for your Post model methods or other custom behavior here.
end
