require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { create(:user, name: 'Mb') }

  describe 'GET /users' do
    before do
      get users_path
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before do
      get user_path(id: user.id)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the show template' do
      expect(response.body).to render_template(:show)
    end
  end
end
