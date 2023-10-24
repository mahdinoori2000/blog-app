require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', post_counter: 0)
    @first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', like_counter: 0, comment_counter: 0)
    @second_post = Post.create(author: @user1, title: 'post2', text: 'This is my second post', like_counter: 0, comment_counter: 0)
    @third_post = Post.create(author: @user1, title: 'post3', text: 'This is my third post', like_counter: 0, comment_counter: 0)
    @fourth_post = Post.create(author: @user1, title: 'post4', text: 'This is my fourth post', like_counter: 0, comment_counter: 0)
    visit "/users/#{@user1.id}"
  end
  
  it "should displays the user's profile picture" do
    expect(page).to have_css("img[src*='#{@user1.photo}']")
  end

  it "should displays the username" do
    expect(page).to have_content(@user1.name)
  end

  it "should displays the number of posts " do
    expect(page).to have_content(@user1.post_counter)
  end

  it "should displays the user's bio" do
     expect(page).to have_content(@user1.bio)
  end
end
