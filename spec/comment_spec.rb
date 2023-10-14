require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:example) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end

  subject { Comment.new(user: @user, post: @post) }

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'increments comment_counter of associated post after save' do
    expect do
      subject.save!
    end.to change { @post.reload.comment_counter }.by(1)
  end
end
