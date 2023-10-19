require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts'
      expect(response.body).to include('Here is the post for the user')
      expect(response.body).to include('Post: this is the post text')
      expect(response.body).to include('Number of likes: 5')
      expect(response.body).to include('Number of comments: 8')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is the post number 1 for the user number')
      expect(response.body).to include('Post: this is post text')
      expect(response.body).to include('Comment from user: 2')
    end
  end
end