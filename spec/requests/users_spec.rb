require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index and /show' do
    it 'Should get users list page' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'User Name'
      expect(response).to render_template('index')
    end
    it 'Should get details of the user with id of 7' do
      get '/users/7'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'See all posts'
      expect(response).to render_template('show')
    end
  end
end
