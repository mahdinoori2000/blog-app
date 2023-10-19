require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users/index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('This is the users list')
    end
  end

  describe 'GET /users/show/:id' do
    it 'returns a successful response' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1'
      expect(response.body).to include('User Details')
      expect(response.body).to include('User ID: 1')
    end
  end
end
