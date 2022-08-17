require 'rails_helper'

RSpec.describe 'testing posts_controller', type: :request do
  context ' testing posts#index' do
    it 'return a http status 200' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'render should have a posts_container class' do
      get '/users/1/posts'
      expect(response.body).to include('post_title')
    end
  end

  context 'testing posts#show' do
    it 'return a http status 200' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end

    it 'render should have a posts_container class' do
      get '/users/1/posts/1'
      expect(response.body).to include('post_title')
    end
  end
end
