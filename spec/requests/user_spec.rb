require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'Pass expected tests for users#index' do
      get '/users'
      expect(response.status).to eq(200)
      expect(response.body).to include('List of all static users')
      expect(response).to render_template(:index)
    end

    it 'Respond successfully to the users#show' do
      get '/users/234'
      expect(response.status).to eq(200)
      expect(response.body).to include('Details of current user')
      expect(response).to render_template(:show)
    end
  end
end
