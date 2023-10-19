# spec/controllers/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index, params: { id: 1 } # You can change the user ID as needed
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index, params: { id: 1 } # You can change the user ID as needed
      expect(response).to render_template(:index)
    end

    it 'assigns the correct posts information' do
      get :index, params: { id: 1 } # You can change the user ID as needed
      expect(assigns(:posts)).to eq({
        id: '1',
        post_text: 'this is the post text',
        likes: 5,
        comments: 8
      })
    end
  end

  describe 'GET show' do
    it 'returns a successful response' do
      get :show, params: { id: 1, post_id: 1 } # You can change the user and post ID as needed
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: 1, post_id: 1 } # You can change the user and post ID as needed
      expect(response).to render_template(:show)
    end

    it 'assigns the correct post information' do
      user_id = 1
      post_id = 1
      get :show, params: { id: user_id, post_id: post_id } # You can change the user and post ID as needed
      expect(assigns(:post)).to eq({
        post_id: post_id.to_s,
        user_id: user_id.to_s,
        post_text: 'this is post text',
        comments: 5
      })
    end
  end
end
