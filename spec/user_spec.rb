require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates presence of name' do
    user = User.new
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'should return the name correctly' do
    user = User.create(name: 'Tom')
    user.valid?
    expect(user.name).to eq('Tom')
  end

  it 'validates posts_counter is an integer greater than or equal to zero' do
    user = User.new(posts_counter: 5)
    user.valid?
    expect(user.errors[:posts_counter]).to be_empty

    user.posts_counter = -1
    user.valid?
    expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')

    user.posts_counter = 'not_an_integer'
    user.valid?
    expect(user.errors[:posts_counter]).to include('is not a number')
  end

  it 'should return the post_counter number correctly' do
    user = User.create(posts_counter: 5)
    user.valid?
    expect(user.posts_counter).to eq(5)
  end
end
