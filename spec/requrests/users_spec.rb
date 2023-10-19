require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the correct user information' do
        user_id = 1
        get :show, params: { id: user_id }
        expect(assigns(:user)).to eq({
          id: user_id.to_s,
          name: 'mahdi noori',
          bio: 'This is the bio of the user'
        })
      end      
  end
end
