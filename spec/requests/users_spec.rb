require 'rails_helper'

RSpec.describe 'testing users_controller', type: :request do
  context ' testing users#index' do
    it 'return a http status 200' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'render should have a users_container class' do
      get '/users'
      expect(response.body).to include('user_title')
    end
  end

  context 'testing users#show' do
    it 'return a http status 200' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get '/users/1'
      expect(response).to render_template('show')
    end

    it 'render should have a users_container class' do
      get '/users/1'
      expect(response.body).to include('user_title')
    end
  end
end
