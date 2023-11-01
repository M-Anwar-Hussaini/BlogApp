require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'Pass tests for posts' do
      get '/users/343/posts'
      expect(response.status).to eq(200)
      expect(response.body).to include('List of all posts')
      expect(response).to render_template(:index)
    end

    it 'pass tests for post#show' do
      get '/users/23/posts/234'
      expect(response.status).to eq(200)
      expect(response.body).to include('List of current')
      expect(response).to render_template(:show)
    end
  end
end
